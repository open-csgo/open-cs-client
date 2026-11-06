# Open CS client

The client-side Lua mod providing Open CS HUD, menus, and server mod-channel communication. It requires Luanti 5.18 or newer; the development client build is pinned to 5.18.0.

## Development setup

Follow the [development setup guide](https://github.com/open-csgo/open-cs-dev#readme) to build the Linux client and start the Docker Compose server. Clone this repository beside `open-cs` and `open-cs-dev`, then run `./client.sh alice` from `open-cs-dev` to connect as `alice/alice`. The launcher installs and enables this mod in an isolated player profile automatically. Restart the client to pick up Lua changes; rebuilding Luanti is unnecessary.

## Manual installation

Use a Luanti 5.18 client with an Open CS server. In the client's user directory:

1. Copy or link this checkout to `clientmods/open_cs_client`.
2. Add `load_mod_open_cs_client = true` to `clientmods/mods.conf`.
3. Set `enable_client_modding = true` and `enable_mod_channels = true` in `minetest.conf`.

The Open CS server must permit client mods (`csm_restriction_flags = 0`) and enable mod channels (`enable_mod_channels = true`). HUD textures come from the server's game mods.

For installed Linux builds, the default user directory is `~/.minetest`; set `LUANTI_USER_PATH` to use a separate directory. Run-in-place builds use their own installation directory instead.
