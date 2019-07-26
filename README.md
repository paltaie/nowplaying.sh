# `nowplaying.sh`: IRC nostalgia for the 21st century!

Remember being in IRC chatrooms back in the day and having those crazy scripts that modded the hell out of your terminal
or - for Windows users - mIRC installation?

Remember how a bunch of them had a feature where it pastes the currently
playing track from your Winamp into the channel? Why not recreate it for the 21st century with Spotify!

`nowplaying.sh` will read your currently playing Spotify track and save it into your clipboard. So you can show off
your to your friends

## Setup
1. Clone this repo (or just get `nowplaying.sh` by itself)
2. Go to https://spotifybash.mybluemix.net/login - this will take you to Spotify so that you can authorise `nowplaying.sh` (app name: SpotifyBash) to access your "now playing" data from Spotify.
3. Just follow the prompts!

## Adding nowplaying.sh as a shortcut
In Ubuntu (and possibly other GNOME systems?), Go to Settings -> Keyboard, and press the "+" at the bottom to add a new shortcut. Mine is:

- Name: `Spotify now playing`
- Command: `bash /home/patrickaltaie/nowplaying.sh`
- Shortcut: `Ctrl + Alt + C`

## Revoking `nowplaying.sh`'s access
Had enough of `nowplaying.sh`? Visit https://www.spotify.com/us/account/apps/ to revoke `nowplaying.sh`'s access.

## Contributing
Feel free to contribute or modify the script as you see fit! It's currently only been tested for Ubuntu but would be
good to get some improvements for other platforms.

## License
![CC BY-SA 3.0](https://licensebuttons.net/l/by-sa/3.0/88x31.png "CC BY-SA 3.0")

This work is licensed under a Creative Commons Attribution-ShareAlike 3.0 Unported License:
https://creativecommons.org/licenses/by-sa/3.0/
