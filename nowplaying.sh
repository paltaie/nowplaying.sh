#!/bin/bash -e
# To get started, go to https://spotifybash.paltaie.com/login to authorise SpotifyBash to access your Now Playing data, and follow the prompts
REFRESH_TOKEN='__YOUR_REFRESH_TOKEN_HERE__'
###

#Check commands we want exist: curl, jq, xclip, notify-send (optional)
CMD_FAILURES=''
for cmd in curl jq notify-send xclip; do
  command -v "${cmd}" >/dev/null 2>&1 || CMD_FAILURES="${CMD_FAILURES},${cmd}"
done

if (( "${#CMD_FAILURES}" > 0 )); then
  printf -- '%s\n' "The following dependencies are missing: ${CMD_FAILURES/,/}" >&2
  exit 1
fi

#Declare some vars
TOKEN=$(curl -s https://spotifybash.paltaie.com/token?refreshToken=${REFRESH_TOKEN} | jq -r '.access_token')
TMPFILE=/tmp/spotify-$(date +%s).json
ALBUM_IMAGE=/tmp/spotify-img-$(date +%s).jpg

curl -sH "Authorization: Bearer ${TOKEN}" "https://api.spotify.com/v1/me/player/currently-playing" > "${TMPFILE}"

if ! [ -s "${TMPFILE}" ] || [ "$(jq -r '.is_playing' "${TMPFILE}")" == "false" ]
then
        notify-send "No music currently playing"
        rm "${TMPFILE}"
        exit 0
fi

curl -s "$(jq -r '.item.album.images | min_by(.height) | .url' "${TMPFILE}")" -o "${ALBUM_IMAGE}"
NP="Now Playing: $(jq -r '.item.artists | map(.name) | join(", ")' "${TMPFILE}") - $(jq -r '.item.name' "${TMPFILE}") • $(jq -r '.item.album.name' "${TMPFILE}")"
notify-send -i "${ALBUM_IMAGE}" "${NP}"
echo -n "${NP}" | xclip -selection c
sleep 0.2
rm "${TMPFILE}" "${ALBUM_IMAGE}"

