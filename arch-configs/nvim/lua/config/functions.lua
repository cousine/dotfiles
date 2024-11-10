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
