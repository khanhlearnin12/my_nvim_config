-- h sinh : 1h 20 trua
return {
	"AntonVanAssche/music-controls.nvim",
	opts = {
		players = { "spotify", "vlc", "mpv" },
		default_player = "auto",
		notification_config = {
			enable = true,
			timeout = 3000,
		},
	},
}
