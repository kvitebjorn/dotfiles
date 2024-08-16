call plug#begin()

" List your plugins here
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
Plug 'wincent/terminus'
Plug 'yegappan/lsp'

call plug#end()

colorscheme catppuccin-mocha

let lspOpts = #{autoHighlightDiags: v:true}
autocmd User LspSetup call LspOptionsSet(lspOpts)

let lspServers = [#{
	\	  name: 'clang',
	\	  filetype: ['c', 'cpp'],
	\	  path: '/usr/bin/clangd',
	\	  args: ['--background-index']
	\ }]
autocmd User LspSetup call LspAddServer(lspServers)
