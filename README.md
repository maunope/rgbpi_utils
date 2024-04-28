# rgbpi_artwork_matcher
Some awk&amp;regexp magic to map  libretro artwork repository files to rgbpi OS game codes

## First very crude version, current capabilities:

- takes a set of png artwork images and creates copies matching rgppi namign scheme
- creates box,ingame and title screen images
- creates USA/EUR/JAP versions, defaults to EUR if the region can't be determined
- matches names covering the majority of required correction (i.e. stripping special chars, version numbers, etc.)

## How to use:
- clone https://github.com/libretro-thumbnails/libretro-thumbnails
- some dataset, like amiga artwork, get better mapping percentage from other sources, i.e. https://forums.launchbox-app.com/files/file/3533-media-pack-commodore-amiga-damiend-collection/
- provide three folders for Box Art, Title Screen and Snaps, Libretro Thumbnails repo comes in this form. any name will do as long as it ends with `[boaxrts|snaps|titles]`
- **important** process one system at a time, don't mix images from different systems.
- **important** only PNG images are processed
- run  `sh map.sh Platform OutputFolder MatchFile [--debug] [--resize] [--sourcefolder=SourceFolder]`, note that output folder **will be erased** a rebuilt from scratch, **Platform**  must match one of the system names present in the prepped **games.dat** file (sortedgames.dat is prebuilt and comes with this repository)
- sample: `sh map.sh megadrive  output_megadrive  sortedgames.dat  --sourcefolder=./megadrive`
- renamed files are in the output folder, the need resizing for optimal display quality, imagemagik (https://imagemagick.org/index.php) is a valid option,  `mogrify -resize 300x225 *.png -quality 100` will resize all your image to fit rgbpi resolution

## Todo:
- script the creation of sortedgames.dat instead of using a prebuilt one
- cover remaining missed matches, priority on partial matches, i.e "Monstone" vs "Monstone - A Hard Days Knight" (maybe finding a more suitable artwork set will do? )
- ~~script the resizing of images, I'm currently using Imagemagik offline~~
- ~~remove hardcoded parameters and create tidy parameters input~~
- automate the cloning of artwork repo
- enable the matching of several systems simultaneously
- define and implement some criteria to pick the best image when more than one is available for the same game/platform/locale
- "World" cover overrides "eur", give precedence to eur if available
