# Import Tool

I keep my photos/video/audio that I record on an external hard drive organized in folders by day. Each day has a folder. 

Eg

```
2018-06-16/file.mp3
2018-06-15/video.mov
```

This tool makes it easy to import media into these folders by looking at the file creation date and copying it to the correct folder. At the moment it is hard-coded to import to `/Volumes/WD My Passport`. This can be changed in `ImportTool.bash`.

## Usage

Open `build/ImportTool.app` and select files. Or drag files in.

## Development

This is built with [Platypus](https://sveinbjorn.org/platypus), which makes it easy to wrap a shell script into a GUI application.

The shell script is written in bash. See `ImportTool.bash`.


## Meta

Richard Caceres – [@rchrd2](https://github.com/rchrd2)

Distributed under the MIT license. See ``LICENSE`` for more information.
