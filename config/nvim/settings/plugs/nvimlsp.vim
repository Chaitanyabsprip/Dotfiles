let g:diagnostic_virtual_text_prefix = ''
let g:diagnostic_enable_virtual_text = 1

let g:completion_confirm_key = "\<C-y>"
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
let g:completion_enable_snippet = 'UltiSnips'
let g:completion_matching_smart_case = 1
let g:completion_trigger_on_delete = 1

:lua << EOF
  local nvim_lsp = require('lspconfig')
    local on_attach = function(_, bufnr)
      require('completion').on_attach()
      local opts = { noremap=true, silent=true }
      vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
      vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
      vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
      vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
      vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
      vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>nD', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
      vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>nr', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
      vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
      vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>nd', '<cmd>lua vim.lsp.util.show_line_diagnostics()<CR>', opts)
    end
    local servers = {'jsonls', 'vimls', 'clangd', 'tsserver', 'cssls', 'html', 'jdtls', 'sumneko_lua'}
    for _, lsp in ipairs(servers) do
      nvim_lsp[lsp].setup {
        on_attach = on_attach,
      }
    end

----------------------------------  DART  --------------------------------------
  local dart_capabilities = vim.lsp.protocol.make_client_capabilities()
  dart_capabilities.textDocument.codeAction = {
    dynamicRegistration = false;
    codeActionLiteralSupport = {
        codeActionKind = {
            valueSet = {
               "",
               "quickfix",
               "refactor",
               "refactor.extract",
               "refactor.inline",
               "refactor.rewrite",
               "source",
               "source.organizeImports",
            };
        };
    };
  }
  nvim_lsp.dartls.setup({
    on_attach = dart_attach;
    init_options = {
      onlyAnalyzeProjectsWithOpenFiles = true,
      suggestFromUnimportedLibraries = false,
      closingLabels = true,
    };
    capabilities = dart_capabilities;
  })
----------------------------------   XX   --------------------------------------
  nvim_lsp.yamlls.setup{}
EOF

command! -buffer -nargs=0 LspShowLineDiagnostics lua require'jumpLoc'.openLineDiagnostics()
nnoremap <buffer><silent> <C-h> <cmd>LspShowLineDiagnostics<CR>
command! Format execute 'lua vim.lsp.buf.formatting()'

:lua << EOF
  require'nvim-treesitter.configs'.setup {
    ensure_installed = "maintained",
    highlight = {
      enable = true,
      disable = { },
    },
  }
EOF

nn <silent> pr :call TermBufMExecCodeScript(&filetype, 'run')<CR>
nn <silent> pf :call TermBufMExec('pbpaste > input')<CR>

let g:termbufm_code_scripts = {
      \ 'python': { 'build': [''],                                     'run': ['cat input | python %s', '%'] },
      \ 'cpp':    { 'build': ['g++ -std=c++11 %s', '%'],               'run': ['cat input | ./a.out'] },
      \ 'java':   { 'build': ['javac %s', '%'],                        'run': ['cat input | java %s', '%:r'] },
      \ 'c':      { 'build': ['gcc %s', '%'],                          'run': ['cat input | ./a.out'] },
      \ }

" nn <silent> <leader>j :NextDiagnosticCycle<CR>
" nn <silent> <leader>k :PrevDiagnosticCycle<CR>
