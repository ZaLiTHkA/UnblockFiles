# PowerShell Unblock File Helper

the primary purpose of this script is to simplify the process of running `Unblock-File` on one or more files, potentially inside nested folders.

it is built as a PowerShell module for the sake of portability, in the sense that, once loaded, it's functions may be executed from any directory.

## Module Installation

this module is not currently published to the PSGallery, it may be one day, but for now it must be installed from this GitHub repo directly. a helper script has been added to this project to handle this process.

execute the following command in a PowerShell prompt to install it locally:

```pwsh
irm https://raw.githubusercontent.com/ZaLiTHkA/UnblockFiles/main/install-unblock-module.ps1 | iex
```

once installed, this module may be imported into any PowerShell session with the following command:

```pwsh
Import-Module UnblockFiles
```

> NOTE: this is done automatically at the end of the installation, but it is not a persistent system change. you will need to call this again if you open a new terminal session.

## Basic Module Usage

by default, this script will operate on your current working directory. this can be changed, but we will get to that later.

the easiest way to use this, is to open a PowerShell session in the directory where you have files that you wish to unlock, and run the following command:

```pwsh
Unblock-Files
```

with no arguments provided, this will simply execute your system's `Unblock-File` command on each file in the current working directory.

## Runtime Arguments

this module currently supports the following runtime arguments:

- `-Path <path>`, which allows you to specify an alternate target directory to process.
  - this path may be relative or absolute, or stored in an environment variable.
  - if the path contains spaces, wrap it in double quotes.
- `-Depth <int>`, which allows you to specify the depth that this script will recurse into the target directory.
  - this defaults to `0`, meaning it will not recurse into any subdirectories.
  - to allow infinite recursion, set this to `-1`.

for example:

- `Unblock-Files -Depth 3` will look 3 levels deep from the current working directory for files that could be unblocked.
- `Unblock-Files -Path .\2025-10\` will look at the root contents of the `2025-11` folder in the current working directory, ignoring any sub-folders it may contain.
- `Unblock-Files -Path "..\Other Folder\2024-11\" -Depth 2` will look 2 levels deep from a directory located inside of a sibling to the current working directory.
- `Unblock-Files -Path "$HOME\Documents\Scanned Documents\"` will expand the variable and look at the root contents of a path in your current user "home" directory.
