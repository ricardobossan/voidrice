-- Prefer using .editorconfig instead of omnsharp.json, as that seems to be the tendency.

local pid = vim.fn.getpid()

-- WARNING: This requireds changing permissions: chmod +rx /.local/share/nvim/mason/packages/omnisharp/libexec/OmniSharp
local omnisharp_bin = HOME .. "/.local/share/nvim/mason/packages/omnisharp/libexec/OmniSharp"
-- Or you can use the one from pacman
--local omnisharp_bin = "/usr/bin/omnisharp"

require("lspconfig").omnisharp.setup({
  handlers = {
    ["textDocument/definition"] = require("omnisharp_extended").handler,
  },
  cmd = { omnisharp_bin, "--languageserver", "--hostPID", tostring(pid) },
  -- Enables support for reading code style, naming convention and analyzer
  -- settings from .editorconfig.

  enable_editorconfig_support = true,

  -- If true, MSBuild project system will only load projects for files that
  -- were opened in the editor. This setting is useful for big C# codebases
  -- and allows for faster initialization of code navigation features only
  -- for projects that are relevant to code that is being edited. With this
  -- setting enabled OmniSharp may load fewer projects and may thus display
  -- incomplete reference lists for symbols.
  enable_ms_build_load_projects_on_demand = false,

  -- Enables support for roslyn analyzers, code fixes and rulesets.
  enable_roslyn_analyzers = true,

  -- Specifies whether 'using' directives should be grouped and sorted during
  -- document formatting.
  organize_imports_on_format = true,

  -- Enables support for showing unimported types and unimported extension
  -- methods in completion lists. When committed, the appropriate using
  -- directive will be added at the top of the current file. This option can
  -- have a negative impact on initial completion responsiveness,
  -- particularly for the first few completion sessions after opening a
  -- solution.
  enable_import_completion = true,

  -- Specifies whether to include preview versions of the .NET SDK when
  -- determining which version to use for project loading.
  sdk_include_prereleases = true,

  -- Only run analyzers against open files when 'enableRoslynAnalyzers' is
  -- true
  analyze_open_documents_only = false,
})

--[[ Had to comment out because razor/blazor files would crash when I edited them.
-- Razor syntax hilight (html, actually)
vim.api.nvim_create_autocmd({ "BufWinEnter", "BufEnter", "BufRead", "BufNewFile" }, {
  pattern = { "*.cshtml", "*.razor", noteBuff, notesDefault, notesCustom },
  command = "set filetype=html.cshtml.razor"
})
--]] 
