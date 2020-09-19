# Intro
This disassembly can rebuild the game, Spiritual Warfare, for the Gameboy

The scripts in this project rely on the original rom being in the project's
root directory, renamed to 'OR'

# The mapper
Spiritual Warfare's mapper is a custom Wisdom Tree mapper, used for the other 4
Wisdom Tree games.

There are no longer 2 addressed banks, the whole 32KB of addressable rom space
is a switchable bank, so bank 1 is at offset $8000, for example, and not at $4000

You switch to bank XX by writing anything to YYXX, with YY being a value between
$00 and $7f

Since swapping banks will change the code you're currently executing, the usual
pattern in these games is to keep common 'bank 0'-like functionality at the beginning
of each bank, so when you swap within that section, you are still executing predictable code

# Directories
Only stuff that may not be immediately obvious
* `code` - all the code, maybe a little bit of data
    * `bank_000.s` - core engine stuff
    * `common.*` - the shared 'bank 0'-like code
    * `quizzes.s` - sometimes you can spawn an angel, that on contact, prompts
        you with a 5-question quiz. Answering these gives you birds and health
    * `roomFlags.s` - code around storing temporary data of the last 10-ish rooms
        so that enemies/items don't just spawn so soon after getting them
    * `scripting.s` - decoding of scripting commands used by entities
* `data`
    * `*_roomStructsAndLayouts.s` - contains variable-sized structs for rooms,
        and compressed room layout data
    * `*_oamData.s` - indexes that when run against a vram tile conversion table,
        gets you the relevant top-left tile idx for 1 of an NPC's sprites
    * `bank_004.s` - possibly sound data
    * `roomGroupStructs.s` - rooms are grouped, and this file contains info about
        the groups, with some bytes still having unknown purpose
    * `tileTypeConversionTable.s` - for each of the $20 tilesets, each value
        in a tile layout is checked against here to turn into a tile type that
        determines how it interacts with the player, room flags, npcs, etc
    * `vramTileConversionTables.s` - for each of the $20 tilesets, each value
        in a tile layout is checked against here to turn into its actual tile idx,
        eg an invisible wall is converted to a black tile
* `garbage` - left over, converted NES code, talking to NES ports
* `gfx` - compressed graphics and pngs of the graphics
* `include` - ram definitions, macros, etc
* `json` - intermediary structures for working with the scripts
* `layouts` - as in vram bg/window layouts
* `roomGroup_gfx` - pngs of grouped rooms laid out based on a group's width and height
* `scripts` - scripting language used for entities
* `tools` - various python files for extracting data, laying out data, etc.
    May (Does) contain questionable os.system calls out of want to pump out nice roomGroup_gfx
