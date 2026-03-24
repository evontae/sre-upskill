# Tools

A collection of utility scripts built to solve real operational problems.

## Scripts

### file_finder.py — File Extension Finder

A command line tool that searches your home directory for files matching 
a given extension. Built to solve the problem of tracking down scripts 
and files scattered across a local machine.

**Features**
- Validates file extension input before searching
- Recursively searches from home directory
- Shows total count of matching files
- Option to display file names only or full file paths

**Usage**
```bash
python3 file_finder.py
```

**Example**
```
Please enter a file type to search: (ex:.py, .csv, .sh)
.py
Searching for all .py files....
Searching for matching files in /Users/evo.....

There are 47 files matching .py

Press 1 to list file names only
Press 2 to list full file paths
```

## Technologies
Python, pathlib