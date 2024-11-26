# File Search Scripts

This repository contains a Bash script and a Tcl script that together allow you to search for files in the current directory based on a specified pattern. The results are logged to a specified log file.

## Scripts Overview

### 1. rnscript.sh

A Bash script that:
- Accepts a directory, file pattern, and optional mode arguments.
- Logs all actions to a log file with a timestamp.
- Invokes the `srchscript.tcl` script to search for files matching the provided pattern in the specified directory.


### 2. srchscript.tcl

A Tcl script that:
- Searches the specified directory for files that match the provided pattern.
- Handles optional modes: silent (no output) and verbose (additional logging).
- Prints the matching file names to the console.

## Prerequisites

- **Bash**: The `rnscript.sh` Bash script should run on any Unix-like system that supports Bash.
- **Tcl**: The `srchscript.tcl` Tcl script requires Tcl to be installed. You can check if Tcl is installed with the command:
  ```bash
  tclsh --version
- Use `chmod +x rnscript.sh srchscript.tcl` to make the shell script executable.

