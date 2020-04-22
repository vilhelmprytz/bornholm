# operation-bornholm

[![Build Status](https://travis-ci.com/operation-bornholm/bornholm.svg?branch=master)](https://travis-ci.com/operation-bornholm/bornholm)

The Operation Bornholm game.

## Getting started

If you are on Windows, you can download the pre-built Windows executable from the latest release [here](https://github.com/VilhelmPrytz/bornholm/releases). Just click the downloaded `.zip` and run `bornholm.exe`.

If you are on Linux, you need to have [LOVE2D](https://love2d.org) installed since we don't provide Linux binaries. You can then download `bornholm.love` from the GitHub release page [here](https://github.com/VilhelmPrytz/bornholm/releases).

To run it from Linux:

```bash
love bornholm.love
```

## Controls and game objective

Use `A` and `D` to move left or right. Use spacebar to jump and aim with your mouse. The objective is to survive as long as possible to get a high score. Each time you shoot a "ghost" your score increases by one. If a ghost manages to touch the player, the game is over.

Use escape to exit the game completely. Press Enter (Return) to restart game when dead.

## Requirements for development

* [LOVE2D](https://love2d.org) (version 11.3)
* `love` command in your path (instructions on how to add this available on the official LÖVE website)

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
