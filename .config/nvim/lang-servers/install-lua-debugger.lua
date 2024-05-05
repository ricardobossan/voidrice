local lfs = require("lfs")

local function getHome_OSAgnostic()
	if os.getenv("HOME") then
		return os.getenv("HOME")
	elseif os.getenv("USERPROFILE") then
		return os.getenv("USERPROFILE")
	else
		error("Unable to determine the home directory.")
	end
end

local home = getHome_OSAgnostic()


-- @brief Path separator based on the operating system
local ps = package.config:sub(1, 1)

--local posix = require("posix")
--local INSTALL_FOLDER = posix.realpath(home .. ps .. ".local" .. ps .. "share" .. ps .. "nvim")

local INSTALL_FOLDER = ""

if(Is_windows()) then
	INSTALL_FOLDER = home .. ps .. "AppData" .. ps .. "Local" .. ps .. "nvim-data"
else
  INSTALL_FOLDER = home .. ps .. ".local" .. ps .. "share" .. ps .. "nvim"
end

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
--print(next(lfs.dir(INSTALL_FOLDER .. "/local-lua-debugger-vscode")))


function isFolderEmpty(folderPath)
	local success, iter, dirObj = pcall(lfs.dir, folderPath)
	if not success then
		return nil, "Error: " .. iter -- Return nil and error message
	end
end

---[[ TODO: This needs improvement. Only works by accident ]]
local isEmpty, error = isFolderEmpty(INSTALL_FOLDER .. ps .. "local-lua-debugger-vscode")
if isEmpty == nil or isEmpty then
	execute_command("git clone " .. LOCAL_LUA_DEBUGGER_VSCODE_URL)
else
	print("Repository already has contents. Skipping cloning.")
end

-- Change directory to the cloned repository
local repository_folder = INSTALL_FOLDER .. ps .. "local-lua-debugger-vscode"
print("Changing directory to:", repository_folder)
lfs.chdir(repository_folder)

local npm_command = 'sudo npm i && sudo npm run build'
---[[ TODO: Make switch for windows and linux. This currently uses windows
local command_to_execute = 'bash -c ' .. '"' .. npm_command .. '"' -- If it fails, just wsl --shutdown and try again
--]]

os.execute(command_to_execute)

