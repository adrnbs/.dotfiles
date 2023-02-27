# .dotfiles
![base](https://user-images.githubusercontent.com/15268681/221452886-b70ed81e-87c3-43ae-86a6-362a7dd4c8b8.png)
Collection of configurations from a Gentoo based system. Some tool configurations will require changes based on system browser, lock screen, etc. I will mention the items to be updated, per section, but should not be used as an all inclusive list and are subject to change. Some changes may be explicitly noted in tool configuration `.conf` files, but will be mentioned for posterity here as well.

These configurations rely specifically on x11 as the display server, as well as OpenRC rather than systemd. Each section will rely on a "**key points**" area, which will give digestible information on potential nuances with said configuration file.

### tools
- WM: [awesome](https://awesomewm.org/)
- Term: [kitty](https://sw.kovidgoyal.net/kitty/)
- Media: [mpv](https://mpv.io/)
- Code/notes: [nvim](https://neovim.io/)
- Compositor: [picom](https://github.com/jonaburg/picom) (specifically jonaburg fork)
- Files: [ranger](https://github.com/ranger/ranger)

# Configurations
## awesome

Main `rc.lua` driver configuration is lifted from github.com/lcpz. There are a number of copycat themes that can be grabbed - for my purpose, blackburn has been reconfigured to support [catppuccin](https://github.com/catppuccin/catppuccin) as there is no official theme for awesomewm.

### key points
- New themes can be added to `local themes` section; new themes must be sourced from `~/.config/awesome/themes/%s/theme.lua` where `%s` is e.g. `catppuccin`
- Theme can be updated from same path, under `~../theme.lua`
- If not using `slock` for lock screen, update keybind under:
```lua
-- Setup bind for slock to lock screen
awful.key({ altkey, "Control" }, "l" function () awful.spawn.with_shell("slock") end,
          { description = "lock screen", group = "hotkeys"}),
```
- Volume up/down and toggle mute are specifically configured for System76's Lemur Pro, YMMV with function keys working out of the box

- Print screen specifically set as well, utilizing `scrot` - update if not using `scrot`
- `picom` and `fehbg` are set to run automatically with awesomewm, update if necessary
-- `fehbg` is a custom script to handle the loading of the wallpaper. To utilize this functionality execute the following:
```bash
# make sure you have feh, on gentoo this is
sudo emerge -av media-gfx/feh

# create a file to act as fehbg
touch ~/fehbg

# use your favorite editor to populate fehbg with the following
#!/bin/bash

feh --bg-scale ~/.walls/current.jpg # update accordingly depending on your path(s)

# move fehbg to the correct location
sudo mv ~/fehbg /usr/bin/fehbg

# make sure it can be executed
chmod u+x /usr/bin/fehbg
```

## kitty
Requires a functionally complete nerd font, unless fonts are replaced with your own. I use Hack for mine. Standard issue otherwise.

### key points
- Update `font_family`, `bold_font`, et al.
- Update `background_opacity` per taste
- Comes with catppuccin mocha

## mpv
![mpv](https://user-images.githubusercontent.com/15268681/221452900-60d4d2bb-3382-4e95-9b0c-63621298bc70.png)

Current mpv configuration is not entirely hammered out, but allows a nice cache threshold to avoid buffering, and is HQ. Videos start paused.

### key points
- Uses `mpv 'link` via terminal to execute
- Unfinished videos are stored within `~/.config/mpv/watch_later` via files containing metadata, but must be enabled within config
- `mpv` has a specific opacity rule within `~/.config/picom/picom.conf` where mpv will not be transparent even when unfocused, update to taste

## neovim
![nvim](https://user-images.githubusercontent.com/15268681/221452926-d650e9f2-1eca-4e35-bdf8-7729704b7fb8.png)

I will save myself the trouble of going into depth here, but it easier to understand than the emacs configuration. A good point of reference is `~/.config/nvim/lua/keys.lua` which will explain keybinds.

### key points
- Theme support build in via catppuccin mocha
- Uses packer to handle neovim plugins, please read `~/.config/nvim/init.lua` on the initial setup of packer to avoid startup errors

## picom
Specifically using the jonaburg fork, not many notable mentions here. Primarily used for reducing screen tearing and supporting animations + opacity.

### key points
- Update rounded corners according to taste/exclusions
- Update opacity settings according to taste/exclusions
- Window blur settings

## ranger
![ranger](https://user-images.githubusercontent.com/15268681/221452935-3298f463-2c5a-4ea4-8ba0-620d9364899c.png)

Note that `ranger` incurs blur from `picom` - can be added to list of excluded applications similar to `firefox` or `mpv`.

### key points
- Relies on `ueberzug` for image display preview; make sure it is installed
- Uses `dragon` for drag and drop functionality, can be activated by `<Ctrl-d>` or by navigating all the way to the file via `l`
- Allows functionality into web pages that may support file drag and drop
