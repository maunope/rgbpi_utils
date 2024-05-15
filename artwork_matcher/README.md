# rgbpi_artwork_matcher
Some awk&amp;regexp magic to map  libretro artwork repository files to rgbpi OS game codes

## Prerequisites:

- Root access to RGBPI is required to write images, you can use rgbpi_extras to get it (https://github.com/sd2cv/RGBPi-Extra/)
- (optional) install imagemagick to resize images

## First  version, current capabilities:

- takes a set of png artwork images and creates copies matching rgppi namign scheme
- creates box,ingame and title screen images
- creates USA/EUR/JAP versions, defaults to EUR if the region can't be determined
- matches names covering the majority of required correction (i.e. stripping special chars, version numbers, etc.)
- can use a lookup file to enhance the mappin of image filenames and games.dat rom filenames

## How to use:
- **backup your existing images folder**
- clone https://github.com/libretro-thumbnails/libretro-thumbnails
- some dataset, like amiga artwork, get better mapping percentage from other sources, i.e. https://forums.launchbox-app.com/files/file/3533-media-pack-commodore-amiga-damiend-collection/
- provide three folders for Box Art, Title Screen and Snaps, Libretro Thumbnails repo comes in this form. any name will do as long as it ends with `[boaxrts|snaps|titles]`
- **important** process one system at a time, don't mix images from different systems.
- **important** only PNG images are processed
- run  `sh rgbpi_images_map.sh Platform OutputFolder MatchFile [--debug] [--resize] [--sourcefolder=] [--imagelookupfile=]`, note that output folder **will be erased** a rebuilt from scratch, **Platform**  must match one of the system names present in the prepped **games.dat** file (sortedgames.dat is prebuilt and comes with this repository)
- sample: `sh rgbpi_images_map.sh megadrive  output_megadrive  sortedgames.dat  --sourcefolder=./megadrive`
- renamed files are in the output folder, the need resizing for optimal display quality, imagemagik (https://imagemagick.org/index.php) is a valid option,  `mogrify -resize 300x225 *.png -quality 100` will resize all your image to fit RGBPI resolution
- a lookup file for amiga is provided (amiga_names.dat), based on https://github.com/libretro/libretro-database.git content. 

## Dang! it's not matching all images!
In order for images to match game codes, the .png filename must follow the same format as the rom filename, the script covers many mismatch cases, but fails for names that differ too much, e.g.
"Speedball 2 - Brutal Deluxe" is not matched to "Speedball 2".
For heavy mismatch cases, it's possible to use an external lookup file, one for amiga is provided in this repo.
there's still tons of room for improvement, but creating matches based on file names only comes with intrinsic limits, if you're not getting that specific image for that one game you keep playing matched, the best workaround is to rename individual png files, i.e:
`mv Speedball\ 2\ -\ Brutal\ Deluxe.png Speedball\ 2.png`
will do the trick.


## Todo:

- ~~cover remaining missed matches, this dat repo looks like the best option as it matches libretro artwork repo filenames with rom filenames, that would remove the need for search keys creation altogether. https://github.com/libretro/libretro-database/blob/master/dat/Nintendo%20-%20GameCube.dat~~
- automate the creation of prepped lookup files based on libretro db repository content
- automate the cloning of artwork repo
- enable the matching of several systems simultaneously
- define and implement some criteria to pick the best image when more than one is available for the same game/platform/locale
- "world" cover overrides "eur", give precedence to eur if available
- ~~script the creation of sortedgames.dat instead of using a prebuilt one~~
- ~~script the resizing of images, I'm currently using Imagemagik offline~~
- ~~remove hardcoded parameters and create tidy parameters input~~
- ~~allow multiple matches for the same image~~
