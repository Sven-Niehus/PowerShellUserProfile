# PowerShell User Profile

This is my PowerShell User profile that I use every day. The source code for PowerShell is in the [PSProfile](PSProfile/) folder and symlinked to the [PowerShell](PowerShell/) and [WindowsPowerShell](WindowsPowerShell/) folder. 

The repository also includes some [AutoHotkey](https://www.autohotkey.com) source code in the [AHK](AHK/) folder which, at this time, is primarily for making the Microsoft Teams keyboard shortcuts global.

## Installation

To install the user profile you have to clone the repository inside your documents (`$env:USERPROFILE\Documents\`) folder. After restarting your PowerShell session the user profile should be loaded:
```
Loading environment scripts...
Environment Scripts loaded.
```

## Using local environment files

If you have local environment files you can add them to the [PSProfile](PSProfile/) folder with the naming scheme `Env.{EnvName}.ps1` (Example: `Env.Secret.ps1`).

The environment files are in the [PSProfile/.gitignore](PSProfile/.gitignore) file and thus will **not** be included in the git repository.

If you have added the output of the initial loading should look like this:

```
Loading environment scripts...
        Loading Script: $env:USERPROFILE\Documents\PSProfile\Env.Secret.ps1
Environment Scripts loaded.
```