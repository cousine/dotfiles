function InsertCenteredTitleComment()
  -- Get the comment string for the current buffer
  local comment_string = vim.bo.commentstring:match("^(.-)%s") or ""
  -- Prompt the user for a title and convert it to uppercase
  local title = vim.fn.input("Title: "):upper()

  -- If title is empty, replace it with a single padding character
  if title == "" then
    title = "-"
  else
    title = " " .. title .. " "
  end

  -- Define the line width and calculate padding
  local line_width = 80
  local padding = (line_width - #title - #comment_string - 2) / 2 -- Subtract 2 for the spaces around the title

  -- Construct the centered comment line
  local comment_line = comment_string
    .. " "
    .. string.rep("-", math.floor(padding))
    .. title
    .. string.rep("-", math.ceil(padding))

  -- Insert the comment line
  vim.api.nvim_command("put ='" .. comment_line .. "'")
end

-------------------------------------------------------------------------------
-- Initialize a variable to track the toggle state
local duplicates_highlighted = false
local ns_id = vim.api.nvim_create_namespace("dup_highlight")

-- Create an augroup for managing the autocmd
local augroup_id = vim.api.nvim_create_augroup("HighlightDuplicatesGroup", { clear = true })

-- Function to highlight duplicate lines and send to Trouble
function HighlightDuplicates()
  local lines = {}
  local dup_lines = {}

  -- Gather lines and find duplicates
  for i = 1, vim.fn.line("$") do
    local line = vim.fn.getline(i)
    if lines[line] then
      dup_lines[i] = line
    else
      lines[line] = i
    end
  end

  -- Clear previous diagnostics
  vim.diagnostic.reset(ns_id, 0)

  -- Create diagnostics for duplicate lines
  local diagnostics = {}
  for lnum, line in pairs(dup_lines) do
    table.insert(diagnostics, {
      lnum = lnum - 1, -- line numbers are 0-based for diagnostics
      col = 0, -- starting column
      end_col = -1, -- end column (optional)
      message = "Duplicate line: " .. line,
      severity = vim.diagnostic.severity.WARN, -- severity level
    })
  end

  -- Set diagnostics in the current buffer
  vim.diagnostic.set(ns_id, 0, diagnostics)

  -- Open Trouble window if highlighting is enabled
  if duplicates_highlighted then
    vim.api.nvim_buf_clear_namespace(0, -1, 0, -1)
    for lnum, _ in pairs(dup_lines) do
      vim.api.nvim_buf_add_highlight(0, ns_id, "@comment.warning", lnum - 1, 0, -1)
    end

    require("trouble").open({
      mode = "diagnostics",
    })
  end
end

-- Toggle function for duplicates
function ToggleHighlightDuplicates()
  duplicates_highlighted = not duplicates_highlighted

  if duplicates_highlighted then
    HighlightDuplicates() -- Initial call to set diagnostics

    -- Set up an autocmd to update on buffer changes
    vim.api.nvim_create_autocmd("TextChanged", {
      group = augroup_id, -- Assign to the created group
      buffer = 0, -- Current buffer
      callback = HighlightDuplicates, -- Call HighlightDuplicates on buffer change
    })
  else
    -- Clear diagnostics when toggled off
    vim.diagnostic.reset(ns_id, 0)
    require("trouble").close()

    -- Clear the autocmds for the group
    vim.api.nvim_clear_autocmds({ group = augroup_id, buffer = 0 })
  end
end

------------------------------------------------------------------------------

function ToggleCommentStyle()
  -- Get the current comment syntax
  local commentstring = vim.bo.commentstring
  if not commentstring or commentstring == "" then
    vim.notify("No comment syntax detected for this filetype", vim.log.levels.WARN)
    return
  end

  -- Extract the comment prefix (e.g., "//", "#", "/* */", etc.)
  local comment_prefix = commentstring:match("^(.*)%%s.*$")
  if not comment_prefix then
    vim.notify("Unsupported comment syntax format: " .. commentstring, vim.log.levels.ERROR)
    return
  end
  comment_prefix = vim.trim(comment_prefix)

  -- Get the selected range
  local start_line = vim.fn.line("'<")
  local end_line = vim.fn.line("'>")

  -- Process lines in reverse order to avoid shifting issues
  for line_num = end_line, start_line, -1 do
    local line = vim.fn.getline(line_num)
    local next_line = vim.fn.getline(line_num + 1)

    -- Get the indentation level of the current line
    local current_indent = line:match("^%s*")

    if line:find(vim.pesc(comment_prefix)) then
      -- Move comment to a new line above with proper indentation
      local code = line:gsub(vim.pesc(comment_prefix) .. ".*", ""):gsub("%s+$", "")
      local comment = line:match(vim.pesc(comment_prefix) .. ".*")
      vim.fn.setline(line_num, code)
      vim.fn.append(line_num - 1, current_indent .. comment)
    elseif next_line:find(vim.pesc(comment_prefix)) then
      -- Move comment to the same line
      local comment = next_line
      vim.fn.setline(line_num, line .. " " .. comment)

      -- Delete the extra line (the line with just the comment)
      vim.fn.setline(line_num + 1, "") -- Clear the next line
      vim.cmd((line_num + 1) .. "delete") -- Delete the extra line
    end
  end
end

------------------------------------------------------------------------------

-- Function to run semgrep and send findings to Trouble window with loading progress
function RunSemgrepInTrouble()
  -- Get the current file name
  local file = vim.fn.expand("%")
  local spinner = require("custom.spinner")

  spinner.show({
    row = vim.o.lines - 2,
  }, "Running Semgrep...")

  -- Run semgrep command on the current file asynchronously
  local command = "semgrep -q --config auto --json " .. file
  local output = {}

  -- Run semgrep asynchronously with jobstart
  vim.fn.jobstart(command, {
    stdout_buffered = true,
    on_stdout = function(_, data)
      -- Append output lines
      for _, line in ipairs(data) do
        table.insert(output, line)
      end
    end,
    on_stderr = function(_, err)
      -- Handle errors in the command
      vim.notify(table.concat(err, "\n"), vim.log.levels.ERROR)
    end,
    on_exit = function()
      spinner.hide(false) -- Stop the custom spinner
      local diagnostics = {}

      -- Parse the semgrep results (JSON format)
      for _, line in ipairs(output) do
        local ok, result = pcall(vim.fn.json_decode, line)
        if ok and result and result.results then
          -- Extract relevant information from semgrep output
          for _, finding in ipairs(result.results) do
            local start_line = finding.start and finding.start.line or 0
            local start_col = finding.start and finding.start.col or 0
            local severity = vim.diagnostic.severity[finding.severity]
            local message = finding.extra and finding.extra.message or "No message"

            table.insert(diagnostics, {
              bufnr = vim.fn.bufnr(),
              lnum = start_line,
              col = start_col,
              severity = severity,
              message = message,
              source = "semgrep",
            })
          end
        end
      end

      -- Set diagnostics
      local namespace = vim.api.nvim_create_namespace("semgrep")
      vim.diagnostic.set(namespace, 0, diagnostics)

      -- Send diagnostics to Trouble window
      if #diagnostics > 0 then
        -- Use Trouble to display diagnostics
        require("trouble").open({
          mode = "diagnostics",
        })
      else
        vim.notify("No semgrep findings", vim.log.levels.INFO)
      end
    end,
  })
end
