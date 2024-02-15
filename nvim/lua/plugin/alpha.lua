return {
	"goolord/alpha-nvim",
	lazy = false,
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
			[[                                                                     ]],
			[[                                                                   ]],
			[[      ████ ██████           █████      ██                    ]],
			[[     ███████████             █████                            ]],
			[[     █████████ ███████████████████ ███   ███████████  ]],
			[[    █████████  ███    █████████████ █████ ██████████████  ]],
			[[   █████████ ██████████ █████████ █████ █████ ████ █████  ]],
			[[ ███████████ ███    ███ █████████ █████ █████ ████ █████ ]],
			[[██████  █████████████████████ ████ █████ █████ ████ ██████]],
			[[                                                                     ]],
			[[─────────────────────────────────────────────────────────────────────]],
			[[                                                                     ]],
			[[   Absolutely worth the 42-hour epic saga to configure this editor   ]],
			[[                                                                     ]],
			[[                                                                     ]],
		}

		-- Set menu
		dashboard.section.buttons.val = {
			dashboard.button("n", "󰈔  > New file",     "<cmd> ene <BAR> startinsert <cr>"),
			dashboard.button("f", "  > Find file",    "<cmd> Telescope find_files  <cr>"),
			dashboard.button("g", "  > Find text",    "<cmd> Telescope live_grep   <cr>"),
			dashboard.button("r", "  > Find recent ", "<cmd> Telescope oldfiles    <cr>"),
			dashboard.button("l", "󰒲  > Open plugins", "<cmd> Lazy                  <cr>"),
			dashboard.button("q", "  > Quit NeoVim",  "<cmd> qa                    <cr>"),
		}

		-- Configure highlighting
		for _, button in ipairs(dashboard.section.buttons.val) do
			button.opts.hl = { { "Define", 0, 2 }, { "Constant", 3, 7 } }
			button.opts.hl_shortcut = "Special"
		end
		dashboard.section.header.opts.hl = "Identifier"

		-- Send config to alpha
		alpha.setup(dashboard.opts)
	end
}
