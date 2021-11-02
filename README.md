# VapourSynth Plugins for Apple Silicon
I must not be crazy :)

Not tested yet.

## Usage
`brew install EVERYTHING`, and homebrew will install plugins to `$(brew --prefix)/Cellar/{plugin_name}/{tag}/lib` and link them to `$(brew --prefix)/lib`.

But for some reason, VapourSynth cannot automatically load plugins from `$(brew --prefix)/lib`(since there're other dylib(s) and it will throw segmentation fault), so you need to link/copy them to somewhere presents in `~/Library/Application\ Support/VapourSynth/vapoursynth.conf` manually.

## TODO
Use Actions or other CI/CD to build and pack plugins on release.