return {
	"p00f/clangd_extensions.nvim",
	dependencies = { "microsoft/vscode-codicons" },
	lazy = true,
	opts = {
		inlay_hints = {
			inline = true,
		},
		ast = {
			role_icons = {
				type = "",
				declaration = "",
				expression = "",
				specifier = "",
				statement = "",
				["template argument"] = "",
			},
			kind_icons = {
				Compound = "",
				Recovery = "",
				TranslationUnit = "",
				PackExpansion = "",
				TemplateTypeParm = "",
				TemplateTemplateParm = "",
				TemplateParamObject = "",
			},
		},
	},
}
