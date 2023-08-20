---
versão_do_neovim: 0.9
so: Archlinux
shell: zsh
---

# MyNvim

- Minha configuração do Neovim.

## TODO

- Add plugin: ToggleTerm
- ~~Null-ls~~
  - ~~Consider formatting code blocks within markdown with Null-ls's builtin source `cbfmt`~~
  - ~~Markdown **formatter**~~
    - ~~Null-ls's builtin source for `Prettier` should do it properly.~~
      - ~~Worked after uninstalled other servers for markdown in Mason~~
- ~~highlight para markdown (strikethrough, italic, bold, links) ~~
  - ~~Para funcionar preciso rodar manualmente no buffer aberto `:set syntax=highlight`~~
  - ~~Talvez seja melhor acompanhar vídeo ensinando especificamente a configurar markdown no Neovim.~~
- ~~Adicionar silent aos remaps~~
- ~~Regularizar clipboard do terminal para outras janelas~~
- ~~whichkey~~
- ~~Adicionar plugin para TODO nos comments e configurar~~
- ~~LSP, autocomplete e debugger para C#~~

## Guias Usados

- [The Primagean: 0 to LSP: Neovim RC From Scratch](https://youtu.be/w7i4amO_zaE)
- [alpha2phi: Neovim for Beginners — C#](https://alpha2phi.medium.com/neovim-for-beginners-c-8d824679bb4a)
- [chris@machine: Unbreakable IDE](https://www.youtube.com/watch?v=Vghglz2oR0c) (DELETADO pelo autor, mas código permanece no [GitHub](https://github.com/LunarVim/nvim-basic-ide))

## Remover configuração anterior

- Verifica versão do Nvim. Na época, a minha foi `v0.9.0`:
  ```bash
  nvim -v
  #NVIM v0.9.0-dev-769+g0f52e2c84
  #Build type: Debug
  #LuaJIT 2.1.0-beta3
  #Compilation: /usr/bin/cc -g -Wall -Wextra -pedantic -Wno-unused-parameter -Wstrict-prototypes -std=gnu99 -Wshadow -Wconversion -Wdouble-promotion -Wmissing-noreturn -Wmissing-format-attribute -Wmissing-prototypes -Wimplicit-fallthrough -Wvla -fno-common -fdiagnostics-color=auto -fstack-protector-strong -DNVIM_UNIBI_HAS_VAR_FROM -DNVIM_MSGPACK_HAS_FLOAT32 -DNVIM_TS_HAS_SET_MATCH_LIMIT -DNVIM_TS_HAS_SET_ALLOCATOR -DINCLUDE_GENERATED_DECLARATIONS -D_GNU_SOURCE -DMIN_LOG_LEVEL=1 -I/home/ricar/source/repos/neovim/.deps/usr/include/luajit-2.1 -I/usr/include -I/home/ricar/source/repos/neovim/.deps/usr/include -I/home/ricar/source/repos/neovim/build/src/nvim/auto -I/home/ricar/source/repos/neovim/build/include -I/home/ricar/source/repos/neovim/build/cmake.config -I/home/ricar/source/repos/neovim/src
  #Compilado por ricar
  #
  #Features: +acl +iconv +tui
  #See ":help feature-compile"
  #
  #    arquivo vimrc de sistema: "$VIM/sysinit.vim"
  #            padrão para $VIM: "/usr/local/share/nvim"
  #
  #Run :checkhealth for more info
  ```
- Delete a instalação anterior:
  - Delete o codigo-fonte:
    ```bash
    rm -rfv ~/source/repos/neovim/
    ```
  - Remove Neovim com o gerenciador de arquivos:
    ```bash
    yay -R neovim
    ```
  - Remove binários:
    ```bash
    sudo rm /usr/local/bin/nvim
    ```
- clone o código-fonte do Neovim:
  ```bash
  git clone https://github.com/neovim/neovim.git
  git checkout release-0.9
  ```
- Instale do código-fonte:
  ```bash
  make CMAKE_BUILD_TYPE=RelWithDebInfo
  sudo make install
  ```

## Estrutura de Pastas

- Estrutura de pastas deve estar onde configurações de ambiente do Neovim vão apontar. Consultar com o comando `:h rtp` (rtp é runtime path)

  - Para mim:

    ```bash
    tree $HOME/.config/nvim
    #├── init.lua
    #├── lua
    ```

  - Módulos chamados a partir de `require("módulo")` ficam dentro da pasta `$HOME/.config/nvim/lua/`. Os nomes dos módulos são os caminhos sem a extensão `.lua`

## Configura Packer (Gerenciador de pacotes/plugins)

1. Remove a pasta da instalação anterior de Packer:

```bash
rm -rfv ~/.local/share/nvim/site/pack/packer
```

2. Instalar [Packer](https://github.com/wbthomason/packer.nvim)

   - Só consegui fazer funcionar no Arch com o [pacote do AUR](https://aur.archlinux.org/packages/nvim-packer-git)
   - Configuração:

     ```bash
     touch ~/.config/nvim/plugins.lua
     ```

     - Conteúdo:

       ```lua
       -- Only required if you have packer configured as `opt`
       vim.cmd [[packadd packer.nvim]]

       return require('packer').startup(function(use)
       -- Packer can manage itself
       use 'wbthomason/packer.nvim'
       --[[ Explorador de arquivos
       use {
       'nvim-tree/nvim-tree.lua',
       }
       --]]
       end)
       ```

     - No Neovim, execute `:PackerSync`, saia do Neovim e entre de novo.
     - Tentei salvar e carregar snapshots em vão.
       - Os snapshots são salvos em `~/.cache/nvim/packer.nvim/`
       - Eu consigo salvar na pasta que quero se colocar o caminho absoluto.

   - Instalar plugins dentro da função `return packer.startup(function(use) ... end`. eg.:
     ```lua
     use {
     'nvim-tree/nvim-tree.lua',
     }
     ```

## Explorador de Arquivos

- Eu uso [NvimTree](https://github.com/nvim-tree/nvim-tree.lua)

  - Configuração: - Acrescente à configuração do Packer(plugins.lua), dentro do método `return require('packer').startup(function(use)`

```lua
use {
'nvim-tree/nvim-tree.lua',
}

```

## LSP

### LSP Zero

- [lsp-zero](https://github.com/VonHeikemen/lsp-zero.nvim/blob/main/advance-usage.md)

- lua/plugins.lua:

  ```lua
  --...
  use {
  'VonHeikemen/lsp-zero.nvim',
  branch = 'v1.x',
  requires = {
  -- LSP Support
  {'neovim/nvim-lspconfig'},             -- Required
  {'williamboman/mason.nvim'},           -- Optional
  {'williamboman/mason-lspconfig.nvim'}, -- Optional

  -- Autocompletion
  {'hrsh7th/nvim-cmp'},         -- Required
  {'hrsh7th/cmp-nvim-lsp'},     -- Required
  {'hrsh7th/cmp-buffer'},       -- Optional
  {'hrsh7th/cmp-path'},         -- Optional
  {'saadparwaiz1/cmp_luasnip'}, -- Optional
  {'hrsh7th/cmp-nvim-lua'},     -- Optional

  -- Snippets
  {'L3MON4D3/LuaSnip'},             -- Required
  {'rafamadriz/friendly-snippets'}, -- Optional
  }
  }
  --...
  ```

- ./after/plugin/lsp.lua:

  ```lua
  -- Learn the keybindings, see :help lsp-zero-keybindings
  -- Learn to configure LSP servers, see :help lsp-zero-api-showcase
  local lsp = require('lsp-zero')
  lsp.preset('recommended')

  lsp.setup()

  vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  update_in_insert = false,
  underline = true,
  severity_sort = false,
  float = true,
  })
  ```

### Null-ls

- [Link](
