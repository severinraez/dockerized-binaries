# dockerized binaries

An attempt to isolate binaries and their dependencies, keeping your system clean.

# Usage

Check out this repository, include it's `bin` directory in your `$PATH`.

Run `./build` to prepare the docker images.

# Security

See `lib/wrap.sh` to learn what privileges are given to the containers - they can do a lot that your user can, so it's a good idea to double-check all images used with this technique.

# Available commands

* `elm-format` - Format Elm code when elm/node does not live directly on your system.
