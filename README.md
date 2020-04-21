# operation-bornholm

[![Build Status](https://travis-ci.com/operation-bornholm/bornholm.svg?branch=master)](https://travis-ci.com/operation-bornholm/bornholm)

The Operation Bornholm game.

## Requirements

* [LOVE2D](https://love2d.org) (version 11.3)
* `love` command in your path

## Running locally

Start the repo from within the code.

```bash
love .
```

## Structure

To be documented (this is constantly changing during development)!

* `src/main.lua` - main LOVE2D file
* `src/tiles` - textures for tiles
* `src/maps` - map data structures
* `src/objects` - methods (objects) for each element of the game
  * `src/objects/bullets.lua` - handles bullets (collision, draw, create, delete)
  * `src/objects/enemies.lua` - handles enemies (collision, draw, create, delete)
  * `src/objects/player.lua` - handles player (collision, draw)

## Contributors

The Operation Bornholm project is created and maintained by [Vilhelm Prytz](https://github.com/VilhelmPrytz) and [Pontus Liedgren](https://github.com/PontusLiedgren).
