#!/usr/bin/env tclsh

# TCL script to search for files matching a pattern in a directory.
# Usage: tclsh srchscript.tcl <directory> <search_pattern> <silent> <verbose>
# Arguments:
#   directory       : Directory to search files in.
#   search_pattern  : File name pattern to search (supports wildcards).
#   silent          : 1 to suppress all output, 0 to show output.
#   verbose         : 1 to enable detailed output, 0 for normal behavior.

# Procedure to search files
proc search_files {dir pattern silent verbose} {
    # Get all files in the specified directory
    set files [glob -directory $dir *]

    # Iterate through files
    foreach file $files {
        if {[file isfile $file] && [string match $pattern [file tail $file]]} {
            # Print file name if not in silent mode
            if {$silent == 0} {
                puts $file
            }
        }
    }
}

# Check for correct number of arguments
if {[llength $argv] != 4} {
    puts "Usage: tclsh srchscript.tcl <directory> <search_pattern> <silent> <verbose>"
    exit 1
}

# Parse arguments
set directory [lindex $argv 0]
set search_pattern [lindex $argv 1]
set silent [lindex $argv 2]
set verbose [lindex $argv 3]

# Verbose mode: Output additional information
if {$verbose == 1} {
    puts "Verbose mode enabled."
    puts "Searching in directory: $directory"
    puts "Using pattern: $search_pattern"
    puts "Search started at: [clock format [clock seconds]]"
}

# Call the search_files procedure
search_files $directory $search_pattern $silent $verbose

# Verbose mode: Output search completion details
if {$verbose == 1} {
    puts "Search completed at: [clock format [clock seconds]]"
}
