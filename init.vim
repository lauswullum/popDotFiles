"#################################
"LAUS WULLUM
"################################

call plug#begin('~/.local/share/nvim/plugged')
	Plug 'preservim/nerdtree'
	Plug 'fcpg/vim-fahrenheit'
	Plug 'junegunn/goyo.vim'
    Plug 'JuliaEditorSupport/julia-vim'
	Plug 'itchyny/lightline.vim'
	Plug 'itchyny/calendar.vim'
    Plug 'akinsho/toggleterm.nvim', {'tag' : 'v2.*'}
    Plug 'morhetz/gruvbox'
    Plug 'lervag/vimtex'
    Plug 'brennier/quicktex'
    Plug 'christoomey/vim-tmux-navigator'
    Plug 'miyakogi/seiya.vim'
    Plug 'jalvesaq/Nvim-R', {'branch': 'stable'}
    Plug 'vim-pandoc/vim-pandoc-syntax'
    Plug 'quarto-dev/quarto-vim'
call plug#end()

lua << EOF
-- ToggleTerm
---[[
require('toggleterm').setup{
    size = function(term)
        if term.direction == "horizontal" then
            return 20
        elseif term.direction == "vertical" then
            return vim.o.columns * 0.4
        end
    end,
    open_mapping = [[\\]],
    insert_mappings = false,
    terminal_mappings = true,
    -- on_open = fun(t: Terminal), -- function to run when the terminal opens
    -- on_close = fun(t: Terminal), -- function to run when the terminal closes
    hide_numbers = true,
    shade_filetypes = {},
    shade_terminals = true,
    shading_factor = '1',
    start_in_insert = true,
    persist_size = true,
    direction = 'vertical',
    close_on_exit = true,
    shell = vim.o.shell,
}
-- Functional wrapper for mapping custom keybindings
function map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

map("n", "<leader>t", ":ToggleTermSendVisualSelection<CR>")
function _G.set_terminal_keymaps()
  local opts = {noremap = true}
  vim.api.nvim_buf_set_keymap(0, 't', '<A-h>', [[<C-\><C-n><C-W>h]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<A-j>', [[<C-\><C-n><C-W>j]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<A-k>', [[<C-\><C-n><C-W>k]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<A-l>', [[<C-\><C-n><C-W>l]], opts)
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

--]]
EOF

nnoremap <silent> <A-h> <C-w><C-h>
nnoremap <silent> <A-j> <C-w><C-j>
nnoremap <silent> <A-k> <C-w><C-k>
nnoremap <silent> <A-l> <C-w><C-l>

nnoremap <silent> <Bslash>+ :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Bslash>- :exe "resize " . (winheight(0) * 2/3)<CR>
"require("toggleterm").setup {
"  direction = 'float',
"  open_mapping = [[<c-\>]],
"  on_open = function(term)
"    vim.api.nvim_buf_set_keymap(term.bufnr, "t", "<c-\\>", "exit<CR>", { noremap = true, silent = true })
"  end,
"  close_on_exit = true,
"}

""""" sets for tabs and spaces
set tabstop=4
set shiftwidth=4
set expandtab
set softtabstop=4
set number
let R_buffer_opts = "buflisted"
set timeoutlen=1000
set ttimeoutlen=0
set textwidth=80
set wrap
set relativenumber
set noshowmode
set hidden
map <SPACE> <leader>


let g:latex_to_unicode_file_types = ".*"
let R_assign = 2
let R_rmdchunk = '££'
"autocmd BufNewFile,BufRead *.qmd set filetype=quarto
"autocmd BufNewFile,BufRead *.md set filetype=markdown
"
"Opacity
"hi Normal guibg=none ctermbg=none
"hi LineNr guibg=none ctermbg=none
"hi Folded guibg=none ctermbg=none
"hi NonText guibg=none ctermbg=none
"hi SpecialKey guibg=none ctermbg=none
"hi VertSplit guibg=none ctermbg=none
"hi SignColumn guibg=none ctermbg=none
"hi EndOfBuffer guibg=none ctermbg=none
let g:seiya_auto_enable=0

""""" SET FOR NERDTREE
map <C-n> :NERDTreeToggle<CR>

map <C-y> :Goyo<CR>

tnoremap <Esc><Esc> <C-\><C-n>
"""" Colorscheme
"colorscheme fahrenheit
colorscheme gruvbox

"""" VIM
syntax enable
filetype plugin indent on

" R
inoremap qq :wq<CR>
nnoremap qq :wq<CR>
inoremap q1 :q!<CR>
nnoremap q1 :q!<CR>
inoremap jf %>%

"""" VIMTEX
let g:vimtex_view_general_viewer = 'zathura'

""""" appearance for lightline
let g:lightline = {
      \ 'colorscheme': 'gruvbox',
      \ 'active': {
      \   'left': [['mode', 'paste'], ['absolutepath', 'modified']],
      \   'right': [['lineinfo'], ['percent']]
      \ },
\ }


"#######################
"   QUICKTEX 
"#######################

let g:quicktex_tex = {
    \' '   : "\<ESC>:call search('<+.*+>')\<CR>\"_c/+>/e\<CR>",
    \'mf'  : '$ <+++> $ <++>',
\'Section: Environments' : 'COMMENT',
    \'env' : "\<ESC>Bvedi\\begin{\<ESC>pa}\<CR><+++>\<CR>\\end{\<ESC>pa}\<CR><++>",
    \'exe' : "\\begin{exercise}{<+++>}\<CR><++>\<CR>\\end{exercise}<++>",
    \'prf' : "\\begin{proof}\<CR><+++>\<CR>\\end{proof}",
    \'thm' : "\\begin{theorem}\<CR><+++>\<CR>\\end{theorem}",
    \'lem' : "\\begin{lemma}\<CR><+++>\<CR>\\end{lemma}",
    \'que' : "\\begin{question}\<CR><+++>\<CR>\\end{question}",
    \'cor' : "\\begin{corollary}\<CR><+++>\<CR>\\end{corollary}",
    \'lst' : "\\begin{enumerate}[a)]\<CR>\\item <+++>\<CR>\\end{enumerate}",
    \'cd'  : "\\[\<CR><+++>\<CR>\\]\<CR><++>",
    \'eq'  : "\\begin{align*}\<CR><+++>\<CR>\\end{align*}\<CR><++>",
    \'lstl': "\\begin{lstlisting}\<CR><+++>\<CR>\\end{lstlisting}\<CR><++>",
    \'blk'  : "\\begin{block}{<+++>}\<CR><++>\<CR>\\end{block}\<CR><++>",
    \'bol' : "\\textbf{<+++>} <++>",
    \'ita' : "\\textit{<+++>} <++>",
    \'footn' : "\\footnote{<+++>} <++>",
    \'eqn' : "\\begin{equation}\\label{<+++>}\<CR><++>\<CR>\\end{equation}",
\
\'Section: Common Sets' : 'COMMENT',
    \'bn' : '\(\mathbb{N}\) ',
    \'bz' : '\(\mathbb{Z}\) ',
    \'bq' : '\(\mathbb{Q}\) ',
    \'br' : '\(\mathbb{R}\) ',
    \'bc' : '\(\mathbb{C}\) ',
    \'ba' : '\(\mathbb{A}\) ',
    \'bf' : '\(\mathbb{F}\) ',
\}

let g:quicktex_math = {
    \' '    : "\<ESC>:call search('<+.*+>')\<CR>\"_c/+>/e\<CR>",
\'Section: Lowercase Greek Letters' : 'COMMENT',
    \'alpha'   : '\alpha ',
    \'ga'      : '\alpha ',
    \'beta'    : '\beta ',
    \'gamma'   : '\gamma ',
    \'delta'   : '\delta ',
    \'epsilon' : '\epsilon ',
    \'ge'      : '\varepsilon ',
    \'zeta'    : '\zeta ',
    \'eta'     : '\eta ',
    \'theta'   : '\theta ',
    \'iota'    : '\iota ',
    \'kappa'   : '\kappa ',
    \'lambda'  : '\lambda ',
    \'gl'      : '\lambda ',
    \'mu'      : '\mu ',
    \'nabla'   : '\nabla ',
    \'nu'      : '\nu ',
    \'xi'      : '\xi ',
    \'omega'   : '\omega ',
    \'pi'      : '\pi ',
    \'rho'     : '\rho ',
    \'sigma'   : '\sigma ',
    \'tau'     : '\tau ',
    \'upsilon' : '\upsilon ',
    \'gu'      : '\upsilon ',
    \'phi'     : '\phi ',
    \'phis'     : '\varphi ',
    \'chi'     : '\chi ',
    \'psi'     : '\psi ',
    \
\'Section: Uppercase Greek Letters' : 'COMMENT',
    \'Alpha'   : '\Alpha ',
    \'Beta'    : '\Beta ',
    \'Gamma'   : '\Gamma ',
    \'Delta'   : '\Delta ',
    \'Epsilon' : '\Epsilon ',
    \'Zeta'    : '\Zeta ',
    \'Eta'     : '\Eta ',
    \'Theta'   : '\Theta ',
    \'Iota'    : '\Iota ',
    \'Kappa'   : '\Kappa ',
    \'Lambda'  : '\Lambda ',
    \'Mu'      : '\Mu ',
    \'Nu'      : '\Nu ',
    \'Xi'      : '\Xi ',
    \'Omega'   : '\Omega ',
    \'Pi'      : '\Pi ',
    \'Rho'     : '\Rho ',
    \'Sigma'   : '\Sigma ',
    \'Tau'     : '\Tau ',
    \'Upsilon' : '\Upsilon ',
    \'Phi'     : '\Phi ',
    \'Chi'     : '\Chi ',
    \'Psi'     : '\Psi ',
    \
\'Section: Set Theory' : 'COMMENT',
    \'bn'    : '\mathbb{N} ',
    \'bz'    : '\mathbb{Z} ',
    \'be'    : '\mathbb{E} ',
    \'bd'    : '\mathbb{D} ',
    \'bk'    : '\mathbb{K} ',
    \'bq'    : '\mathbb{Q} ',
    \'bp'    : '\mathbb{P} ',
    \'br'    : '\mathbb{R} ',
    \'bc'    : '\mathbb{C} ',
    \'ba'    : '\mathbb{A} ',
    \'bf'    : '\mathbb{F} ',
    \'bff'   : '\mathfrak{u} ',
    \'cl'    : '\mathfrak{C} ',
    \'subs'  : '\subset ',
    \'in'    : '\in ',
    \'nin'   : '\not\in ',
    \'cup'   : '\cup ',
    \'cap'   : '\cap ',
    \'union' : '\cup ',
    \'sect'  : '\cap ',
    \'smin'  : '\setminus ',
    \'set'   : '\{<+++>\} <++>',
    \'empty' : '\varnothing ',
    \'pair'  : '(<+++>, <++>) <++>',
    \'trian' : '\vartriangle',
    \'boris' : '\mathcal{B} (\mathbb{R})',
    \'sr'    : '\mathscr{<+++>} <++>',
    \'indic' : '\mathbbm{1}_{<+++>} <++>',
    \'dots'  : '\dots ',
    \
\'Section: Logic' : 'COMMENT',
    \'exists'  : '\exists ',
    \'nexists' : '\nexists ',
    \'forall'  : '\forall ',
    \'implies' : '\implies ',
    \'iff'     : '\Leftrightarrow',
    \
\'Section: Relations' : 'COMMENT',
    \'lt'      : '< ',
    \'gt'      : '> ',
    \'leq'     : '\leq ',
    \'geq'     : '\geq ',
    \'eq'      : '= ',
    \'nl'      : '\nless ',
    \'ng'      : '\ngtr ',
    \'nleq'    : '\nleq ',
    \'ngeq'    : '\ngeq ',
    \'neq'     : '\neq ',
    \'neg'     : '\neg ',
    \'uarrow'  : '\uparrow ',
    \'darrow'  : '\downarrow ',
    \
\'Section: Operations' : 'COMMENT',
    \'add'   : '+ ',
    \'min'   : '- ',
    \'frac'  : '\frac{<+++>}{<++>} <++>',
    \'inner'  : '\inner{<+++>}{<++>} <++>',
    \'recip' : '\frac{1}{<+++>} <++>',
    \'fracs' : '\frac1<+++>',
    \'vecs'  : '(<+++>, <++>, <++>) <++>',
    \'mats'  : '\begin{pmatrix} <+++> & <++> // <++> & <++> \end{pmatrix} <++>',
    \'dot'   : '\cdot ',
    \'vert'  : ' \ \vert \ ',
    \'propto': '\propto ',
    \'mult'  : '* ',
    \'partial':' \partial',
    \'exp'   : "\<BS>^{<+++>} <++>",
    \'pow'   : "\<BS>^{<+++>} <++>",
    \'sq'    : "\<BS>^2 ",
    \'cubed' : "\<BS>^3 ",
    \'inv'   : "\<BS>^{-1} ",
    \'cross' : '\times ',
    \
\'Section: Delimiters' : 'COMMENT',
    \'bpara' : '\left( <+++> \right) <++>',
    \'para'  : '(<+++>) <++>',
    \'bsb'   : '\left[ <+++> \right] <++>',
    \'sb'    : '[<+++>] <++>',
    \'bbra'  : '\left\{ <+++> \right\} <++>',
    \'bra'   : '\{<+++>\} <++>',
    \'vt'    : '\abs{<+++>} <++>',
    \'vts'   : '\norm{<+++>} <++>',
    \
\'Section: Group Theory' : 'COMMENT',
    \'sdp'   : '\rtimes ',
    \'niso'  : '\niso ',
    \'subg'  : '\leq ',
    \'nsubg' : '\trianglelefteq ',
    \
\'Section: Functions' : 'COMMENT',
    \'to'     : '\to ',
    \'wedge'  : '\wedge ',
    \'mapsto' : '\mapsto ',
    \'comp'   : '\circ ',
    \'of'     : "\<BS>(<+++>) <++>",
    \'sin'    : '\sin ',
    \'cos'    : '\cos ',
    \'tan'    : '\tan ',
    \'gcd'    : '\gcd(<+++> ,<++>) <++>',
    \'ln'     : '\ln ',
    \'log'    : '\log ',
    \'df'     : '<+++> : <++> \to <++>',
    \'sqrt'   : '\sqrt{<+++>} <++>',
    \'case'   : '\begin{cases} <+++> \end{cases} <++>',
    \
\'Section: LaTeX commands' : 'COMMENT',
    \'sub'    : "\<BS>_{<+++>} <++>",
    \'subn'   : "\<BS>_<+++> <++>",
    \'sone'   : "\<BS>_1 ",
    \'stwo'   : "\<BS>_2 ",
    \'sthree' : "\<BS>_3 ",
    \'sfour'  : "\<BS>_4 ",
    \'ud'     : "\<BS>_{<+++>}^{<++>} <++>",
    \'text'   : '\text{<+++>} <++>',
    \
\'Section: Fancy Variables' : 'COMMENT',
    \'fA' : '\mathcal{A} ',
    \'fo' : '\mathcal{O} ',
    \'fg' : '\mathcal{G} ',
    \'fn' : '\mathcal{N} ',
    \'fp' : '\mathcal{P} ',
    \'ft' : '\mathcal{T} ',
    \'fc' : '\mathcal{C} ',
    \'fm' : '\mathcal{M} ',
    \'ff' : '\mathcal{F} ',
    \'fz' : '\mathcal{Z} ',
    \'fi' : '\mathcal{I} ',
    \'fb' : '\mathcal{B} ',
    \'fl' : '\mathcal{L} ',
    \'fj' : '\mathcal{J} ',
    \'fv' : '\mathcal{V} ',
    \'fX' : '\mathcal{X} ',
    \'fh' : '\mathcal{H} ',
    \
\'Section: Encapsulating keywords' : 'COMMENT',
    \'bar'  : "\<ESC>F a\\overline{\<ESC>f i} ",
    \'tild' : "\<ESC>F a\\tilde{\<ESC>f i} ",
    \'bold' : "\<ESC>F a\\bold{\<ESC>f i} ",
    \'hat'  : "\<ESC>F a\\hat{\<ESC>f i} ",
    \'star' : "\<BS>^* ",
    \'vec'  : "\<ESC>F a\\vec{\<ESC>f i} ",
    \
\'Section: Linear Algebra' : 'COMMENT',
    \'GL'     : '\text{GL} ',
    \'SL'     : '\text{SL} ',
    \'com'    : "\<BS>^c ",
    \'perp'   : "\<BS>^{\\perp} ",
    \'ipr'    : "\\langle <+++>, <++> \\rangle <++>",
    \'matrix' : "\\begin{pmatrix}\<CR><+++>\<CR>\\end{pmatrix}\<CR><++>",
    \'vdots'  : '\vdots & ',
    \'ddots'  : '\ddots & ',
    \
\'Section: Constants' : 'COMMENT',
    \'aleph' : '\aleph ',
    \'inf'   : '\infty ',
    \'one'   : '1 ',
    \'zero'  : '0 ',
    \'two'   : '2 ',
    \'three' : '3 ',
    \'four'  : '4 ',
    \
\'Section: Operators' : 'COMMENT',
    \'int'    : '\int <+++> \mathrm{d}<++> ',
    \'intg'    : '\int _{<+++>}^{<++>} <++> \mathrm{d} <++>',
    \'dev'    : '\frac{d}{d <+++>} <++>',
    \'lim'    : '\lim_{<+++>} <++>',
    \'sum'    : '\sum ',
    \'prod'   : '\prod ',
    \'limsup' : '\limsup ',
    \'liminf' : '\liminf ',
    \'sup'    : '\sup ',
    \'sinf'   : '\inf ',
    \
\'Section: Diagrams' : 'COMMENT',
    \'arrow' : '\arrow[<+++>]{<+direction+}{<+label+>} <++>',
\
\}

let g:quicktex_quarto = {
    \','   : "\<ESC>:call search('<+.*+>')\<CR>\"_c/+>/e\<CR>",
    \'mf'  : '$ <+++> $ <++>',
\'Section: Environments' : 'COMMENT',
    \'env' : "\<ESC>Bvedi\\begin{\<ESC>pa}\<CR><+++>\<CR>\\end{\<ESC>pa}\<CR><++>",
    \'exj' : "```{julia}\<CR><+++>\<CR>```",
    \'exr' : "```{r}\<CR><+++>\<CR>```",
    \'prf' : "\\begin{proof}\<CR><+++>\<CR>\\end{proof}",
    \'thm' : "\\begin{theorem}\<CR><+++>\<CR>\\end{theorem}",
    \'lem' : "\\begin{lemma}\<CR><+++>\<CR>\\end{lemma}",
    \'que' : "\\begin{question}\<CR><+++>\<CR>\\end{question}",
    \'cor' : "\\begin{corollary}\<CR><+++>\<CR>\\end{corollary}",
    \'lst' : "\\begin{enumerate}[a)]\<CR>\\item <+++>\<CR>\\end{enumerate}",
    \'cd'  : "\\[\<CR><+++>\<CR>\\]\<CR><++>",
    \'eq'  : "\\begin{align*}\<CR><+++>\<CR>\\end{align*}\<CR><++>",
    \'lstl': "\\begin{lstlisting}\<CR><+++>\<CR>\\end{lstlisting}\<CR><++>",
    \'blk'  : "\\begin{block}{<+++>}\<CR><++>\<CR>\\end{block}\<CR><++>",
    \'bol' : "\\textbf{<+++>} <++>",
    \'ita' : "\\textit{<+++>} <++>",
    \'footn' : "\\footnote{<+++>} <++>",
    \'eqn' : "\\begin{equation}\\label{<+++>}\<CR><++>\<CR>\\end{equation}",
\
\'Section: Common Sets' : 'COMMENT',
    \'bn' : '\(\mathbb{N}\) ',
    \'bz' : '\(\mathbb{Z}\) ',
    \'bq' : '\(\mathbb{Q}\) ',
    \'br' : '\(\mathbb{R}\) ',
    \'bc' : '\(\mathbb{C}\) ',
    \'ba' : '\(\mathbb{A}\) ',
    \'bf' : '\(\mathbb{F}\) ',
\}
