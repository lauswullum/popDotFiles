" Set g:quicktex_pandoc_enable = 0 if you don't want the math dictionary to be
" enabled in pandoc files
if !get(g:, 'quicktex_quarto_enable', 1)
    finish
endif

if exists('g:quicktex_quarto') && !exists('g:quicktex_math')
    let g:quicktex_math = {}
elseif !exists('g:quicktex_quarto') && exists('g:quicktex_math')
    let g:quicktex_quarto = {}
endif


" LaTeX Mode Keywords {{{

" let g:quicktex_quarto = {
"     \',,' : "\<ESC>:call search('<+.*+>')\<CR>\"_c/+>/e\<CR>",
"     \'m' : '\( <+++> \) <++>',
" \'Section: Environments' : 'COMMENT',
"     \'env' : "\<ESC>Bvedi\\begin{\<ESC>pa}\<CR><+++>\<CR>\\end{\<ESC>pa}",
"     \'exe' : "\\begin{exercise}{<+++>}\<CR><++>\<CR>\\end{exercise}",
"     \'prf' : "\\begin{proof}\<CR><+++>\<CR>\\end{proof}",
"     \'thm' : "\\begin{theorem}\<CR><+++>\<CR>\\end{theorem}",
"     \'lst' : "\\begin{enumerate}[a)]\<CR>\\item <+++>\<CR>\\end{enumerate}",
"     \'eq'  : "\\begin{displaymath}\<CR><+++>\<CR>\\end{displaymath}",
"     \'eqn' : "\\begin{equation}\\label{<+++>}\<CR><++>\<CR>\\end{equation}",
"     \
" \'Section: Other Commands' : 'COMMENT',
"     \'itm'  : '\item ',
"     \'sect' : "\\section*{<+++>}\<CR><++>",
"     \'para' : '(<+++>) <++>',
"     \'qt'   : "``<+++>'' <++>",
"     \
" \'Section: Common Sets' : 'COMMENT',
"     \'bn' : '\(\mathbb{N}\) ',
"     \'bz' : '\(\mathbb{Z}\) ',
"     \'bq' : '\(\mathbb{Q}\) ',
"     \'br' : '\(\mathbb{R}\) ',
"     \'bc' : '\(\mathbb{C}\) ',
"     \'ba' : '\(\mathbb{A}\) ',
"     \'bf' : '\(\mathbb{F}\) ',
" \'Section: Fancy Variables' : 'COMMENT',
"     \'fA' : '\(\mathcal{A}\) ',
"     \'fo' : '\(\mathcal{O}\) ',
"     \'fn' : '\(\mathcal{N}\) ',
"     \'fp' : '\(\mathcal{P}\) ',
"     \'ft' : '\(\mathcal{T}\) ',
"     \'fc' : '\(\mathcal{C}\) ',
"     \'fm' : '\(\mathcal{M}\) ',
"     \'ff' : '\(\mathcal{F}\) ',
"     \'fz' : '\(\mathcal{Z}\) ',
"     \'fi' : '\(\mathcal{I}\) ',
"     \'fb' : '\(\mathcal{B}\) ',
"     \'fl' : '\(\mathcal{L}\) ',
"     \'fv' : '\(\mathcal{V}\) ',
" \'Section: Greek Letters' : 'COMMENT',
"     \'alpha'   : '\alpha',
"     \'ga'      : '\(\alpha\) ',
"     \'beta'    : '\(\beta\) ',
"     \'gamma'   : '\(\gamma\) ',
"     \'delta'   : '\(\delta\) ',
"     \'epsilon' : '\(\varepsilon\) ',
"     \'ge'      : '\(\varepsilon\) ',
"     \'zeta'    : '\(\zeta\) ',
"     \'eta'     : '\(\eta\) ',
"     \'theta'   : '\(\theta\) ',
"     \'iota'    : '\(\iota\) ',
"     \'kappa'   : '\(\kappa\) ',
"     \'lambda'  : '\(\lambda\) ',
"     \'gl'      : '\(\lambda\) ',
"     \'mu'      : '\(\mu\) ',
"     \'nu'      : '\(\nu\) ',
"     \'xi'      : '\(\xi\) ',
"     \'omega'   : '\(\omega\) ',
"     \'pi'      : '\(\pi\) ',
"     \'rho'     : '\(\rho\) ',
"     \'sigma'   : '\(\sigma\) ',
"     \'tau'     : '\(\tau\) ',
"     \'upsilon' : '\(\upsilon\) ',
"     \'gu'      : '\(\upsilon\) ',
"     \'phi'     : '\(\varphi\) ',
"     \'chi'     : '\(\chi\) ',
"     \'psi'     : '\(\psi\) ',
"     \
" \}
" 
