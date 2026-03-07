#!/bin/bash

# =====================================================================#
# Author: Edmond Kacaj <info@edmondkacaj.com>
# License: GNU General Public License v3.0
# Script Name: vscode-project-manager.sh
#
# Description: 
#   This script helps you to easily manage and open your VSCode projects 
#   based on tags from the **Project Manager** plugin. It allows you to 
#   select tags and associated projects from a Rofi menu, making it easier 
#   to organize and open projects. If no tags are found, the script will 
#   fall back to showing all available projects.
#
#   The script interacts with the `projects.json` file, which is used by 
#   the Project Manager plugin in VSCode to store project information such 
#   as project names, tags, and root paths.
#
# Ensure you have the **VSCode Project Manager plugin** installed.
#    - You can install it from here: https://marketplace.visualstudio.com/items?itemName=alefragnani.project-manager
#
# **Setting up a Shortcut**:
# - If you want to trigger the script using a keyboard shortcut, you can configure it within your desktop environment's shortcut settings.
# - Example: If you're using a shortcut like **`ALT+SHIFT+E`**:
#     1. Open **"Keyboard Settings"** or **"Keyboard Shortcuts"** (depending on your system).
#     2. Create a new custom shortcut and set it to run the script, such as `/path/to/emoji-menu.sh --multi` for multi-select or `/path/to/emoji-menu.sh --single` for single-select.
#     3. Assign **`ALT+SHIFT+E`** as the shortcut key.
#     4. Save the changes, and now you can press `ALT+SHIFT+E` to open the emoji selection menu.
#
# Dependencies:
# - `jq`: A command-line JSON processor used to parse the projects.json file.
# - `rofi`: A window switcher and application launcher used to display menus.
# - `code`: The VSCode command-line interface for launching VSCode.
# =====================================================================

# Path to the JSON file where VSCode stores the project information
JSON_FILE="$HOME/.config/Code/User/globalStorage/alefragnani.project-manager/projects.json"

# Check if the JSON file exists
if [ ! -f "$JSON_FILE" ]; then
  echo "Error: The Project Manager JSON file does not exist at $JSON_FILE"
  exit 1
fi

# Fetch all unique tags from the projects.json file
TAGS=$(jq -r '.[] | select(.enabled == true) | .tags[]' "$JSON_FILE" | sort | uniq)

# If tags are found, show available tags in a Rofi menu and capture the selected tag
if [ -n "$TAGS" ]; then
  SELECTED_TAG=$(echo "$TAGS" | rofi -dmenu -p "Select a tag:")

  # If the user cancels or selects nothing, exit the script
  if [ -z "$SELECTED_TAG" ]; then
    echo "No tag selected. Exiting..."
    exit 0
  fi
fi

# If no tag selected or the selected tag is empty, fetch all projects
if [ -z "$SELECTED_TAG" ]; then
  PROJECTS=$(jq -r '.[] | select(.enabled == true) | .name' "$JSON_FILE")
else
  # Get projects related to the selected tag
  PROJECTS=$(jq -r ".[] | select(.enabled == true) | select(.tags | index(\"$SELECTED_TAG\")) | .name" "$JSON_FILE")
fi

# If no projects are found, exit the script
if [ -z "$PROJECTS" ]; then
  echo "No projects found for the selected tag."
  exit 1
fi

# Show available projects in a Rofi menu and capture the selected project
SELECTED_PROJECT=$(echo "$PROJECTS" | rofi -dmenu -p "Select a project to open:")

# If the user cancels or selects nothing, exit the script
if [ -z "$SELECTED_PROJECT" ]; then
  echo "No project selected. Exiting..."
  exit 0
fi

# Get the rootPath for the selected project
ROOT_PATH=$(jq -r ".[] | select(.name == \"$SELECTED_PROJECT\") | .rootPath" "$JSON_FILE")

# Check if the rootPath exists, then open it in VSCode
if [ -d "$ROOT_PATH" ]; then
  code "$ROOT_PATH"
else
  echo "Error: Root path for project '$SELECTED_PROJECT' does not exist at $ROOT_PATH."
  exit 1
fi
