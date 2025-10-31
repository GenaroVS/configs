vim.lsp.config['luals'] = {
  cmd = {'lua-language-server'},
  filetypes = {'lua'},
  root_markers = {'.luarc.json', '.luarc.jsonc'},
}

vim.lsp.config['clangd'] = {
  cmd = { 'clangd', '--background-index' },
  root_markers = { '.git', 'MakeFile', 'compile_commands.json', '.clangd' },
  filetypes = { 'c', 'cpp' },
}

vim.lsp.config['jdtls'] = {
  cmd = { 'jdtls' },
  root_markers = { '.git', 'pom.xml' },
  filetypes = { 'java', 'class' },
}


vim.api.nvim_create_autocmd('LspAttach', {
	callback = function(ev)
        local client = assert(vim.lsp.get_client_by_id(ev.data.client_id))

		local bufmap = function(mode, rhs, lhs)
			vim.keymap.set(mode, rhs, lhs, {buffer = ev.buf})
		end
		bufmap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>')
		bufmap('n', 'grd', '<cmd>lua vim.lsp.buf.declaration()<cr>')
		bufmap('n', 'grr', '<cmd>lua vim.lsp.buf.references()<cr>')
		bufmap('n', 'gri', '<cmd>lua vim.lsp.buf.implementation()<cr>')
		bufmap('n', 'grn', '<cmd>lua vim.lsp.buf.rename()<cr>')
		bufmap('n', 'gra', '<cmd>lua vim.lsp.buf.code_action()<cr>')
		bufmap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>')
		bufmap('n', '<leader>vs', '<cmd>lua vim.lsp.buf.workspace_symbol()<cr>')
		bufmap('n', '<leader>vd', '<cmd>lua vim.diagnostic.open_float()<cr>')
		bufmap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>')
		bufmap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>')
		bufmap('i', '<C-h>', '<cmd>lua vim.lsp.buf.signature_help()<cr>')

        if client:supports_method('textDocument/completion') then
            -- Optional: trigger autocompletion on EVERY keypress. May be slow!
            -- local chars = {}; for i = 32, 126 do table.insert(chars, string.char(i)) end
            -- client.server_capabilities.completionProvider.triggerCharacters = chars
            vim.opt.completeopt = { 'menu', 'menuone', 'noinsert', 'fuzzy', 'popup' }
            vim.lsp.completion.enable(true, client.id, ev.buf, {autotrigger = true})
            bufmap('i', '<C-x>', '<cmd>lua vim.lsp.completion.get()<cr>')
        end
    end
})


vim.lsp.enable('clangd')
vim.lsp.enable('luals')
-- vim.lsp.enable('jdtls')

