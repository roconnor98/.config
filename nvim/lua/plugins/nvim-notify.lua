return{
	"rcarriga/nvim-notify",
	event = "VeryLazy",
	opts = {
		render = "wrapped-compact",
		stages = "static",
		timeout = 1000
	},
	config = function(_, opts)
		local notify = require("notify")
		notify.setup(opts)
		vim.notify = notify
	end,
}
