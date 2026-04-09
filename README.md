2026-04-09 this addon is no longer being developed, please feel free to fork this repo and resurrect.

# QuietCraft

Tired of chat flooding with "So-and-so creates [Item]" from everyone around you?

An efficient, lightweight, high-performance World of Warcraft addon that hides all crafting notifications from other players while leaving your own crafting messages untouched.

## Why use this?

<strong><span style="color:#ba372a">TL;DR</strong></span> <span style="color:#2dc26b">enhanced chat panel peace and quiet in high population areas.</span>

## Key features

- **Crafting spam filter:** hides crafting messages from other players in your chat frames
- **Keeps your crafting messages:** your own crafting notices are untouched so you can track your own progress
- **Lightweight and no config:** works immediately after loading, no options needed
- **Applies to tradeskill + system chat:** filters both `CHAT_MSG_TRADESKILLS` and `CHAT_MSG_SYSTEM`
- **Safe and efficient:** only inspects message text and sender, minimal runtime overhead

## Installation

1. Move/copy the `QuietCraft` folder to your `_retail_/Interface/AddOns/` directory
2. Restart World of Warcraft or logout and login

On load/login, the addon will supressing display of other people's crafting.

## Configuration

The addon requires no set up.

## Technical details

- **Chat filter-based:** uses `ChatFrame_AddMessageEventFilter` to intercept and inspect incoming chat events.
- **Pattern matching:** checks if a message contains crafting phrases like "creates", "created", or "crafted".
- **Player-aware:** preserves messages from the player themselves while filtering other players.
- **Tiny memory footprint:** Uses ~1 KB of RAM. That’s ~20,000× less than RareScanner and ~44,000× less than Auctionator. Put another way: QuietCraft is the size of a single hand written word, while RareScanner is a novel and Auctionator is a full encyclopedia volume.

### Event handling

**QuietCraft** listens to these default chat events:

- `CHAT_MSG_TRADESKILLS`: filters other players’ tradeskill craft announcements
- `CHAT_MSG_SYSTEM`: filters system-cast crafting notifications

The filter function returns true (suppress) for other players’ crafting messages and false (allow) for your own crafting spams and unrelated messages.

## Contributing

Contributions to improve this tool are welcome! To contribute:

1. Fork the repository
2. Create a feature branch
3. Make your changes to the source code or documentation
4. Test with various class configurations and buff scenarios
5. Submit a pull request with a clear description of the improvements

Please ensure your changes maintain compatibility with existing functionality and follows Lua best practices.

## Bugs and new features

Found a bug or want to submit a feature request?
[open an issue here](https://github.com/ExponentiallyDigital/QuietCraft/issues)

## Support

This tool is unsupported and may cause objects in mirrors to be closer than they appear etc. Batteries not included.

## License

This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License along with this program. If not, see <https://www.gnu.org/licenses/>.

Copyright (C) 2026 ArcNineOhNine
