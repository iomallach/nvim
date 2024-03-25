local options = function()
	return {
		defaults = {
			vimgrep_arguments = {
				"rg",
				"-L",
				"--color=never",
				"--no-heading",
				"--with-filename",
				"--line-number",
				"--column",
				"--smart-case",
			},
			prompt_prefix = "   ",
			selection_caret = "  ",
			entry_prefix = "  ",
			initial_mode = "insert",
			selection_strategy = "reset",
			sorting_strategy = "ascending",
			layout_strategy = "horizontal",
			layout_config = {
				horizontal = {
					prompt_position = "top",
					preview_width = 0.55,
				},
				vertical = {
					mirror = false,
				},
				width = 0.87,
				height = 0.80,
				preview_cutoff = 120,
			},
			file_ignore_patterns = { "node_modules" },
			path_display = { "truncate" },
			winblend = 0,
			border = {},
			borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
			color_devicons = true,
			set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
			-- Developer configurations: Not meant for general override
			mappings = {
				n = { ["q"] = require("telescope.actions").close },
				i = {
					["<C-j>"] = require("telescope.actions").move_selection_next,
					["<C-k>"] = require("telescope.actions").move_selection_previous,
				},
			},
		},
		extensions_list = { "themes" },
		extensions = {
			fzf = {
				fuzzy = true,
				override_generic_sorter = true,
				override_file_sorter = true,
				case_mode = "smart_case",
			},
		},
	}
end

return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.6",
	lazy = false,
	dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-lua/plenary.nvim", "andrew-george/telescope-themes" },
	cmd = "Telescope",
	init = function()
		local keymap = require("vim.keymap")
		keymap.set("n", "<leader>ff", "<CMD>Telescope find_files<CR>", { desc = "Telescope Find Files" })
		keymap.set("n", "<leader>fg", "<CMD>Telescope live_grep<CR>", { desc = "Telescope Live Grep" })
		keymap.set("n", "<leader>fb", "<CMD>Telescope buffers<CR>", { desc = "Telescope Find Buffers" })
		keymap.set("n", "<leader>fa", "<CMD>Telescope <CR>", { desc = "Telescope Find All" })
		keymap.set(
			"n",
			"<leader>fz",
			"<CMD>Telescope current_buffer_fuzzy_find<CR>",
			{ desc = "Telescope Find in Buffer" }
		)
	end,
	config = function()
		local telescope = require("telescope")
		opts = options()
		telescope.setup(opts)
		-- load extensions
		for _, ext in ipairs(opts.extensions_list) do
			telescope.load_extension(ext)
		end
	end,
}
