#!/bin/bash

# Function to run a command in the default terminal emulator
function run_in_default_terminal {
  if command -v x-terminal-emulator >/dev/null 2>&1; then
    x-terminal-emulator -e "$SHELL" -c "$1" &
  elif command -v gnome-terminal >/dev/null 2>&1; then
    gnome-terminal -- "$SHELL" -c "$1" &
  elif command -v konsole >/dev/null 2>&1; then
    konsole -e "$SHELL" -c "$1" &
  else
    echo "Default terminal emulator not found. Please install a terminal emulator (e.g., x-terminal-emulator, gnome-terminal)."
    exit 1
  fi
}

run_in_default_terminal "uvicorn inventoryApi:app --reload" &
cd my-app
run_in_default_terminal "npm run dev"