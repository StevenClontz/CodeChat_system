
# Windows PowerShell Installation Script
# **************************************
# 
# 
# 
# Pre-Script Definitions
# ----------------------
# Automatically moves Powershell to the user directory, works better when using powershell as an admin as the default admin location is in "Windows/System32"
cd $env:USERPROFILE
# 
# We're doing our own error handling
$ErrorActionPreference = 'silentlycontinue'
# 
# Version of python required, put into both string and array from to be easier to parse and output
$pythonVersionReq = '3.7.0'
$pythonVersionReqArray = '3','7','0'
 


# 
# Checking if Python is Installed
# --------------------------------------------


$pythonVersion = python --version

# No python at all

if([string]::IsNullOrEmpty($pythonVersion)){
    
    cls;    # clear screen to hide confusing or conflicting powershell error message(s)
    
    echo "Python $pythonVersionReq or later required. Type 'python' and press Enter to install from Microsoft Store, then rerun script."
    
    write-host "`n"     # blank line
    
    Exit;   # abort script
        
    }
    
<#
    # Asking the user if they would like to have python installed on their system
    $response = Read-Host -Prompt "You do not have Python installed, would you like to install the required version ($pythonVersionReq) (y/n)?"
    if($response -eq "y"){
        echo "Downloading Python Version $PyTarget"
        # Downloading Python Unsure if ``-UseDefaulCredential`` is necessary
        # Using Invoke-WebRequest because I couldn't get the other method outlined in the `tutorial <https://lazyadmin.nl/powershell/download-file-powershell>`_ working guide says it's faster though...
        Invoke-WebRequest -Uri $PythonURL -OutFile $PythonDest -UseDefaultCredential
        echo "Python Version $PyTarget Downloaded
        Installing Python"
        Read-Host "Press any button to continue, then click 'Install Now' in popup"
        # 
        # Redirecting to downloads so that we can run our installation
        cd $env:USERPROFILE\Downloads
        # 
        # Installs Python ``Out-Null`` option makes sure the program doesn't continue before the installation completes, The ``/quietly`` just makes no window pop up, which is fine because ``PrependPath=1`` will select the PATH checkbox for us.  
        # Potentially Install-Package could be a better fit, not sure if it only works on Powershell Modules or other exe's too
        Start-Process ".\python-$PyTarget-amd64.exe" -ArgumentList /quietly,PrependPath=1 -Wait
        echo "Python Version $PyTarget Installed Successfully
        "
    }
    # If they don't have python and they don't want us to do it all we can do is let them know what the minimum version to get is
    else{
        echo "Please install the minimum required version of python ($pythonVersionReq) or later
        (Be sure to add to the PATH)"
        exit
    }
}
# Returning to User Dir
cd $env:USERPROFILE
# |
# 
# Grabbing the version of python and splitting it up so as to make parsing easier
$pythonVersion = python --version
$pythonVersion = $pythonVersion.Split()[1]
$pythonVersionMaj = $pythonVersion.Split('.')[0]
$pythonVersionMin = $pythonVersion.Split('.')[1]

# Version Checking
# if the version we have is not greater than or equal to the required version, an updated version must be installed
# checking negative case so that if it evaluates as true (version is less than required) then throw warning
$InstallBool = False;
if ($pythonVersionMaj -lt $pythonVersionReqArray[0]){
    $InstallBool = True
}
elseif($pythonVersionMaj -eq $pythonVersionReqArray[0]){
    if($pythonVersionMaj -lt $pythonVersionReqArray[1]){
        $InstallBool = True
    }
}

if($InstallBool){
    $response = Read-Host -Prompt "You do not have the correct version of Python installed, would you like the script to install the required version ($pythonVersionReq) (y/n)?"
    if($response -eq "y"){
        echo "Downloading Python Version $PyTarget"
        # Downloading Python Unsure if ``-UseDefaulCredential`` in necessary
        Invoke-WebRequest -Uri $PythonURL -OutFile $PythonDest -UseDefaultCredential
        echo "Python Version$PyTarget Downloaded
        
        Installing Python"
        Read-Host "Press any button to continue, then click 'Install Now' in popup"
        cd $env:USERPROFILE\Downloads

        # Installs Python ``Out-Null`` option makes sure the program doesn't continue before the installation completes Using Start-Process over just using the cmd because it allows me to input a string, so we can easily change the target python version. 
        Start-Process ".\python-$PyTarget-amd64.exe" -ArgumentList /quietly,PrependPath=1 -Wait

        echo "Python Version $PyTarget Installed Successfully
        "
    }
    else{
        echo "Please install the required version of python: $pythonVersionReq or later
        "
        exit
    }
}
else{
    echo "Acceptable version of Python found"
}

#>


# Going to the user dir
cd $env:USERPROFILE

<#
# Creating codechat venv
# ----------------------
# We do this so that our installation does not mess with any other installations of python
echo "Creating codechat venv..."
$codechat = Get-Item codechat
if([string]::IsNullOrEmpty($codechat)){
    # Create a virtual enviroment named codechat
    python -m venv codechat
    echo "virtual environment successfully created
    "
}
else{
    echo "'codechat' virtual environment already found, skipping this step
    "
}

# find CodeChat_Server.exe and tell user if just updating or installing
# This could probably be changed, so that it doesn't differentiate seeing as both paths do that same thing.
$CodeChat_Server = Get-Command $env:USERPROFILE\codechat\Scripts\CodeChat_Server
if([string]::IsNullOrEmpty($CodeChat_Server)){
    # Install the CodeChat Server
    echo "installing CodeChat_Server"
    # python -m pip install --upgrade CodeChat_Server
    codechat\Scripts\python -m pip install --upgrade CodeChat_Server
    echo "CodeChat_Server successfully installed
    "
}
else{
    # Update the CodeChat Server
    echo "CodeChat_Server found, running update"
    # python -m pip install --upgrade CodeChat_Server
    codechat\Scripts\python -m pip install --upgrade CodeChat_Server
    echo "CodeChat_Server successfully updated"
}


# `Set-Clipboard <https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.management/set-clipboard?view=powershell-7.2>`_: Copies path of CodeChat_Server to the clipboard for easy pasting and displays path in terminal
$pathToCodeChat = Get-Command $env:USERPROFILE\codechat\Scripts\CodeChat_Server | Select-Object -ExpandProperty Definition
Set-Clipboard $pathToCodeChat
echo "Here is your path to CodeChat (Also copied to your clipboard): $pathToCodeChat"
echo "Now add this path to your plugin's setup - see https://codechat-system.readthedocs.io/en/latest/extensions/contents.html"


# Exit the Script

#>
