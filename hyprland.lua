-- Migrated from hyprland.conf for Hyprland's Lua configuration API.
-- The original file is preserved as hyprland.conf.pre-lua.bak.

-- Monitors
hl.monitor({
	output = "",
	mode = "preferred",
	position = "auto",
	scale = "auto",
})

-- Programs
local terminal = "alacritty"
local fileManager = "dolphin"
local menu = "wofi --show drun"
local browser = "/home/justin/Documents/browsers/zen/zen/zen"
local mainMod = "CTRL + ALT"

-- Autostart
hl.on("hyprland.start", function()
	hl.exec_cmd("redshift")
	hl.exec_cmd("nm-applet")
	hl.exec_cmd("mako")
	hl.exec_cmd("hyprpaper")
end)

-- Environment
hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")

-- Look and feel
hl.config({
	general = {
		gaps_in = 5,
		gaps_out = 20,
		border_size = 2,
		col = {
			active_border = { colors = { "rgba(33ccffee)", "rgba(00ff99ee)" }, angle = 45 },
			inactive_border = "rgba(595959aa)",
		},
		resize_on_border = true,
		allow_tearing = false,
		layout = "dwindle",
	},
	decoration = {
		rounding = 10,
		active_opacity = 1.0,
		inactive_opacity = 1.0,
		shadow = {
			enabled = true,
			range = 4,
			render_power = 3,
			color = "rgba(1a1a1aee)",
		},
		blur = {
			enabled = true,
			size = 3,
			passes = 1,
			vibrancy = 0.1696,
		},
	},
	animations = { enabled = true },
	dwindle = { preserve_split = true },
	master = { new_status = "master" },
	misc = {
		force_default_wallpaper = 0,
		disable_hyprland_logo = true,
	},
	input = {
		kb_layout = "us",
		kb_variant = "",
		kb_model = "",
		kb_options = "",
		kb_rules = "",
		follow_mouse = 1,
		sensitivity = 0,
		touchpad = { natural_scroll = true },
	},
})

-- Animations
hl.curve("myBezier", {
	type = "bezier",
	points = { { 0.05, 0.9 }, { 0.1, 1.05 } },
})
hl.animation({ leaf = "windows", enabled = true, speed = 7, bezier = "myBezier" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 7, bezier = "default", style = "popin 80%" })
hl.animation({ leaf = "border", enabled = true, speed = 10, bezier = "default" })
hl.animation({ leaf = "borderangle", enabled = true, speed = 8, bezier = "default" })
hl.animation({ leaf = "fade", enabled = true, speed = 7, bezier = "default" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 6, bezier = "default" })

-- Input devices and gestures
hl.gesture({ fingers = 3, direction = "horizontal", action = "workspace" })
hl.device({ name = "epic-mouse-v1", sensitivity = -0.5 })

-- Window management and applications
hl.bind("SUPER + Z", hl.dsp.window.close())
hl.bind("SUPER + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind("SUPER + D", hl.dsp.window.pseudo({ action = "toggle" }))
hl.bind("SUPER + F", hl.dsp.window.fullscreen({ action = "toggle" }))

hl.bind(mainMod .. " + Z", hl.dsp.window.close())
hl.bind(mainMod .. " + SHIFT + Q", hl.dsp.exec_cmd("shutdown now"))
hl.bind(mainMod .. " + SHIFT + W", hl.dsp.exec_cmd("reboot"))
hl.bind(mainMod .. " + Y", hl.dsp.exec_cmd(terminal .. " -e tmux"))
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd("blueman-manager"))
hl.bind(mainMod .. " + U", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + I", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + O", hl.dsp.exec_cmd("da-browser-launcher"))
hl.bind(mainMod .. " + N", hl.dsp.exec_cmd("/home/justin/.config/arch-scripts/toggle_waybar.sh"))
hl.bind(mainMod .. " + M", hl.dsp.exec_cmd("kitty -e yazi"))
hl.bind(mainMod .. " + A", hl.dsp.exec_cmd(terminal .. " -e btop"))

-- Direction keys had both focus and workspace actions in the old config;
-- keep both actions on the same key combinations.
hl.bind(mainMod .. " + left", function()
	hl.dispatch(hl.dsp.focus({ direction = "left" }))
	hl.dispatch(hl.dsp.focus({ workspace = "-1" }))
end)
hl.bind(mainMod .. " + right", function()
	hl.dispatch(hl.dsp.focus({ direction = "right" }))
	hl.dispatch(hl.dsp.focus({ workspace = "+1" }))
end)
hl.bind(mainMod .. " + up", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down", hl.dsp.focus({ direction = "down" }))

for i = 1, 9 do
	hl.bind(mainMod .. " + " .. i, hl.dsp.focus({ workspace = i }))
	hl.bind(mainMod .. " + SHIFT + " .. i, hl.dsp.window.move({ workspace = i }))
end
hl.bind(mainMod .. " + 0", hl.dsp.focus({ workspace = 10 }))
hl.bind(mainMod .. " + SHIFT + 0", hl.dsp.window.move({ workspace = 10 }))

hl.bind(mainMod .. " + H", hl.dsp.focus({ workspace = "-1" }))
hl.bind(mainMod .. " + L", hl.dsp.focus({ workspace = "+1" }))
hl.bind("SUPER + j", hl.dsp.focus({ direction = "down" }))
hl.bind("SUPER + k", hl.dsp.focus({ direction = "up" }))
hl.bind("SUPER + h", hl.dsp.focus({ direction = "left" }))
hl.bind("SUPER + l", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + J", hl.dsp.window.move({ workspace = "-1" }))
hl.bind(mainMod .. " + K", hl.dsp.window.move({ workspace = "+1" }))

hl.bind("CTRL + SHIFT + 5", hl.dsp.exec_cmd([[grim ~/Pictures/$(date +'%s_grim.png')]]))
hl.bind("CTRL + SHIFT + 6", hl.dsp.exec_cmd([[grim -o eDP-1 ~/Pictures/$(date +'%s_grim.png')]]))
hl.bind("CTRL + SHIFT + 7", hl.dsp.exec_cmd([[grim -o HDMI-A-1 ~/Pictures/$(date +'%s_grim.png')]]))
hl.bind("ALT + Q", hl.dsp.exec_cmd("echo key k:1 | dotool"))

hl.bind(mainMod .. " + page_up", hl.dsp.workspace.move({ monitor = "l" }))
hl.bind(mainMod .. " + page_down", hl.dsp.workspace.move({ monitor = "r" }))
hl.bind(mainMod .. " + S", hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Audio and media
hl.bind(
	"XF86AudioRaiseVolume",
	hl.dsp.exec_cmd("wpctl set-volume -l 1.4 @DEFAULT_AUDIO_SINK@ 3%+"),
	{ repeating = true }
)
hl.bind(
	"XF86AudioLowerVolume",
	hl.dsp.exec_cmd("wpctl set-volume -l 1.4 @DEFAULT_AUDIO_SINK@ 3%-"),
	{ repeating = true }
)
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"))
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"))
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"))
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"))
hl.bind("XF86AudioStop", hl.dsp.exec_cmd("playerctl stop"))

-- Brightness
hl.bind(mainMod .. " + down", hl.dsp.exec_cmd("brightnessctl s 3%-"), { repeating = true })
hl.bind(mainMod .. " + SHIFT + down", hl.dsp.exec_cmd("brightnessctl s 1%-"), { repeating = true })
hl.bind(mainMod .. " + up", hl.dsp.exec_cmd("brightnessctl s +3%"), { repeating = true })
hl.bind(mainMod .. " + SHIFT + up", hl.dsp.exec_cmd("brightnessctl s +1%"), { repeating = true })

-- Window resizing (same deltas as the old resizeactive bindings)
hl.bind("SHIFT + ALT + right", hl.dsp.window.resize({ x = -15, y = 0, relative = true }), { repeating = true })
hl.bind("SHIFT + ALT + left", hl.dsp.window.resize({ x = 15, y = 0, relative = true }), { repeating = true })
hl.bind("SHIFT + ALT + up", hl.dsp.window.resize({ x = 0, y = 15, relative = true }), { repeating = true })
hl.bind("SHIFT + ALT + down", hl.dsp.window.resize({ x = 0, y = -15, relative = true }), { repeating = true })

-- Window rules
hl.window_rule({
	name = "my-window-border-size",
	match = { class = "my-window" },
	border_size = 10,
})

-- The old config defined this browser path but did not use it in an active binding.
