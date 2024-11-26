#!/bin/bash

# Script Name: rnscript.sh
# Description: Logs actions and invokes a TCL script (srchscript.tcl) for searching files with wildcards.
# Usage: ./rnscript.sh [directory] [pattern] [-silent|-verbose]
# Arguments:
#   directory : Directory to search files in (default: current directory).
#   pattern   : File name pattern to search (supports wildcards).
# Options:
#   -silent | -s  : Suppresses all output to the console.
#   -verbose | -v : Displays additional information during execution.
#   -help | -h    : Displays this help message.

# Help function
function show_help {
    echo "Description: Logs actions and invokes a TCL script (srchscript.tcl) for searching files with wildcards."
    echo "Usage: ./rnscript.sh [directory] [pattern] [-silent|-verbose]"
    echo
    echo "Arguments:"
    echo "  directory   Directory to search files in (default: current directory)."
    echo "  pattern     File name pattern to search (supports wildcards)."
    echo "Options:"
    echo "  -silent | -s  : Suppresses all output to the console."
    echo "  -verbose | -v : Displays additional information during execution."
    echo "  -help | -h    : Displays this help message."
    exit 0
}

# Parse arguments
if [[ "$1" == "-h" || "$1" == "-help" ]]; then
    show_help
fi

DIR=${1:-"."}  # Default to current directory if not provided
PATTERN=$2
MODE=${3:-""}  # Default to no mode if not specified
LOG_FILE="logsearch_$(date +%Y%m%d_%H%M%S).txt"

# Validate arguments
if [[ -z "$PATTERN" ]]; then
    echo "Error: Missing file pattern argument."
    show_help
fi

# Log script start
echo "Script started at $(date)" > "$LOG_FILE"
echo "Searching directory: $DIR" >> "$LOG_FILE"
echo "Using pattern: $PATTERN" >> "$LOG_FILE"

# Run the TCL script
if [[ "$MODE" == "-silent" || "$MODE" == "-s" ]]; then
    # Silent mode
    tclsh srchscript.tcl "$DIR" "$PATTERN" 1 0 >> "$LOG_FILE" 2>&1
elif [[ "$MODE" == "-verbose" || "$MODE" == "-v" ]]; then
    # Verbose mode
    tclsh srchscript.tcl "$DIR" "$PATTERN" 0 1 | tee -a "$LOG_FILE"
else
    # Default mode
    tclsh srchscript.tcl "$DIR" "$PATTERN" 0 0 | tee -a "$LOG_FILE"
fi

# Log script end
echo "Script ended at $(date)" >> "$LOG_FILE"

# Notify user of log file location
echo "Log file created: $LOG_FILE"
