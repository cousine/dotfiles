#!/bin/bash

# Function to handle the default action after timeout
default_action() {
  echo -e "\n${CYAN}→ No input provided. Defaulting to running code checks."
  RUN_CHECKS="y"
}

# Define color codes
RED='\033[0;31m'
GREEN='\033[0;32m'
CYAN='\033[0;36m'
ORANGE='\033[38;5;214m' # Orange-like color
NC='\033[0m'            # No Color

# Emojis for success and failure
SUCCESS_EMOJI="✅"
FAILURE_EMOJI="❌"

# Print the prompt asking the user if they want to run code checks
echo -ne "${ORANGE}Do you want to run code checks (semgrep and golangci-lint)? (Y/n): ${NC}"

# Allow user input and set default action if no input within 15 seconds
read -t 15 RUN_CHECKS || default_action

# Default to "yes" if no input or timeout
RUN_CHECKS=${RUN_CHECKS:-y}

if [[ "$RUN_CHECKS" != "y" && "$RUN_CHECKS" != "Y" ]]; then
  echo -e "${CYAN}→ Skipping checks. Proceeding with push.${NC}"
  exit 0
fi

# Run Semgrep CI
echo -e "${CYAN}→ Running Semgrep checks before pushing...${NC}"
semgrep ci --config=.semgrep
SEMREP_RESULT=$?

if [ $SEMREP_RESULT -ne 0 ]; then
  echo -e "${RED}${FAILURE_EMOJI} Semgrep checks failed. Push aborted.${NC}"
  exit 1
fi
echo -e "${GREEN}${SUCCESS_EMOJI} Semgrep checks passed.${NC}"

# Run golangci-lint for new changes with the specified options
echo -e "${CYAN}→ Running golangci-lint on new changes...${NC}"
golangci-lint run -new-from-rev=HEAD~1 --fast --color always
LINT_RESULT=$?

if [ $LINT_RESULT -ne 0 ]; then
  echo -e "${RED}${FAILURE_EMOJI} golangci-lint checks failed. Push aborted.${NC}"
  exit 1
fi
echo -e "${GREEN}${SUCCESS_EMOJI} golangci-lint checks passed.${NC}"

# Allow the push
echo -e "${GREEN}${SUCCESS_EMOJI} All checks passed. Proceeding with push.${NC}"
exit 0
