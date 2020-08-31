#!/bin/sh

# intro trademark screen
#python tools/decompressGfx.py 1:65c5 1
#python tools/genTilemap.py \
#  l:3:1980:0:168:14:12
#python tools/gfx.py png gfx_layout.bin --width=32

# enter password screen
#python tools/decompressGfx.py 1:65c5 1
#python tools/genTilemap.py \
#  l:3:13d4:0:168:14:12
#python tools/gfx.py png gfx_layout.bin --width=32

# inventory screen
#python tools/decompressGfx.py 1:65c5 1
#python tools/genTilemap.py \
#  l:3:16aa:0:168:14:12
#python tools/gfx.py png gfx_layout.bin --width=32

# round border screen
#python tools/decompressGfx.py 1:65c5 1
#python tools/genTilemap.py \
#  l:3:153f:0:168:14:12
#python tools/gfx.py png gfx_layout.bin --width=32

# 1st game screen - 1st script decompresses appropriate gfx
python tools/buildUpRoomTiles.py 16 3
python tools/genTilemap.py
python tools/gfx.py png gfx_layout.bin --width=32
rm customLayout.bin

rm customBank0Tiles.bin
rm gfx_layout.bin