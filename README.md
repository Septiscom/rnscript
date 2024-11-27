# File Search Scripts

This repository contains a Bash script and a Tcl script that together allow you to search for files in the current directory based on a specified pattern. The results are logged to a specified log file.

## Installation

To use the file search scripts, you need to clone this repository to your local machine.

1.Use the following command to clone the repository
```bash
git clone https://github.com/Septiscom/rnscript.git
```
2.Make the scripts executable:
```bash
chmod +x rnscript.sh srchscript.tcl
```
3.Ensure Tcl is installed on your system. Check using:
```bash
tclsh --version
```
## Scripts Overview

### 1. rnscript.sh

A Bash script that:
- Accepts a directory, file pattern, and optional mode arguments.
- Logs all actions to a log file with a timestamp.
- Invokes the `srchscript.tcl` script to search for files matching the provided pattern in the specified directory.

Usage:

```bash
./rnscript.sh [directory] [pattern] [-silent|-verbose]

Options:

    directory: Directory to search files in (default: current directory).
    pattern: File name pattern to search (supports wildcards).
    -silent | -s: Suppress all output.
    -verbose | -v: Enable detailed output.
    -help | -h: Display help.

Example Usage:

1.Search for all .txt files in the current directory:
      ./rnscript.sh . "*.txt"

2.Search for all .log files in /var/log with verbose output:
      ./rnscript.sh /var/log "*.log" -v
```
### 2. srchscript.tcl

A Tcl script that:
- Searches the specified directory for files that match the provided pattern.
- Handles optional modes: silent (no output) and verbose (additional logging).
- Prints the matching file names to the console.

Usage:
```bash
tclsh srchscript.tcl <directory> <search_pattern> <silent> <verbose>

Example Usage:

1.Search for .conf files in /etc without suppressing output:
      tclsh srchscript.tcl /etc "*.conf" 0 0

2.Search with verbose logging enabled:
      tclsh srchscript.tcl /etc "*.conf" 0 1
```
## Prerequisites

- **Bash**: The `rnscript.sh` Bash script should run on any Unix-like system that supports Bash.
- **Tcl**: The `srchscript.tcl` Tcl script requires Tcl to be installed. You can check if Tcl is installed with the command:
  ```bash
  tclsh --version
  ```
  ```bash
- Use `chmod +x rnscript.sh srchscript.tcl` to make the shell script executable.
  ```
