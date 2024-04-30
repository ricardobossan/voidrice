-- Lua script for installation, compatible with Unix-like and Windows systems
local lfs = require("lfs")

-- Determine the path separator based on the operating system
local path_separator = package.config:sub(1,1)

-- Determine the home directory based on the operating system
local home_directory
if os.getenv("HOME") then
    home_directory = os.getenv("HOME")
elseif os.getenv("USERPROFILE") then
    home_directory = os.getenv("USERPROFILE")
else
    error("Unable to determine the home directory.")
end

local INSTALL_FOLDER = home_directory .. path_separator .. ".local" .. path_separator .. "share" .. path_separator .. "nvim"
local LOCAL_LUA_DEBUGGER_VSCODE_URL = "https://github.com/tomblind/local-lua-debugger-vscode"

-- Function to execute shell commands
local function execute_command(cmd)
    print("Executing command:", cmd)
    local result = os.execute(cmd)
    if result then
        print("Command executed successfully")
    else
        print("Command execution failed")
    end
end

-- Function to check if a directory exists
local function directory_exists(path)
    return lfs.attributes(path, "mode") == "directory"
end

-- Ensure the installation folder exists
if not directory_exists(INSTALL_FOLDER) then
    print("Creating installation folder:", INSTALL_FOLDER)
    lfs.mkdir(INSTALL_FOLDER)
end

-- Change directory to the installation folder
print("Changing directory to:", INSTALL_FOLDER)
lfs.chdir(INSTALL_FOLDER)

-- Clone the repository
execute_command("git clone " .. LOCAL_LUA_DEBUGGER_VSCODE_URL)

-- Change directory to the cloned repository
local repository_folder = INSTALL_FOLDER .. path_separator .. "local-lua-debugger-vscode"
print("Changing directory to:", repository_folder)
lfs.chdir(repository_folder)

-- Install dependencies and build
execute_command("npm install")
execute_command("npm run build")
