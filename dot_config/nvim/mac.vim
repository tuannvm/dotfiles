lua << EOF
-- Load the colorscheme
vim.g.solarized_disable_background = true
require('solarized').set()
EOF

set clipboard=unnamed
let g:solarized_term_italics=0
