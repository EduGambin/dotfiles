return {
	"goolord/alpha-nvim",
	lazy = false,
	priority = 100,
	dependencies = "nvim-tree/nvim-web-devicons",
	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")

		-- Set header
		dashboard.section.header.val = {
			[[                                                                     ]],
			[[                                                                     ]],
			[[                                                                     ]],
			[[                                                                     ]],
			[[                                                                     ]],
			[[      ████ ██████           █████      ██                    ]],
			[[     ███████████             █████                            ]],
			[[     █████████ ███████████████████ ███   ███████████  ]],
			[[    █████████  ███    █████████████ █████ ██████████████  ]],
			[[   █████████ ██████████ █████████ █████ █████ ████ █████  ]],
			[[ ███████████ ███    ███ █████████ █████ █████ ████ █████ ]],
			[[██████  █████████████████████ ████ █████ █████ ████ ██████]],
			[[─────────────────────────────────────────────────────────────────────]],
			[[                                                                     ]],
			[[   Absolutely worth the 42-hour epic saga to configure this editor   ]],
		}

		-- Set menu
		dashboard.section.buttons.val = {
			dashboard.button("n", "󰈔  > New file", "<cmd> ene <BAR> startinsert <CR>"),
			dashboard.button("f", "  > Find file", "<cmd> Telescope find_files <CR>"),
			dashboard.button("g", "  > Find text", "<cmd> Telescope live_grep <CR>"),
			dashboard.button("r", "  > Find recent ", "<cmd> Telescope oldfiles <CR>"),
			dashboard.button("l", "󰒲  > Open plugins", "<cmd> Lazy <CR>"),
			dashboard.button("q", "  > Quit NeoVim", "<cmd> qa <CR>"),
		}

		-- Configure highlighting
		for _, button in ipairs(dashboard.section.buttons.val) do
			button.opts.hl = { { "Define", 0, 4 }, { "Boolean", 5, 7 } }
			button.opts.hl_shortcut = "Boolean"
		end
		dashboard.section.header.opts.hl = {
			{ { "", 0, -1 } },
			{ { "", 0, -1 } },
			{ { "", 0, -1 } },
			{ { "", 0, -1 } },
			{ { "", 0, -1 } },
			{ { "Special", 0, 50 }, { "String", 51, -1 } },
			{ { "Special", 0, 50 }, { "String", 51, -1 } },
			{ { "Special", 0, 89 }, { "String", 90, -1 } },
			{ { "Special", 0, 84 }, { "String", 85, -1 } },
			{ { "Special", 0, 96 }, { "String", 97, -1 } },
			{ { "Special", 0, 96 }, { "String", 97, -1 } },
			{ { "Special", 0, 106 }, { "String", 107, -1 } },
			{ { "Comment", 0, -1 } },
			{ { "", 0, -1 } },
			{ { "Comment", 0, -1 } },
		}

		-- Send config to alpha
		alpha.setup(dashboard.opts)
	end,
}
