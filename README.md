# rgbpi_artwork_matcher
Some awk&amp;regexp magic to map  libretro artwork repository files to rgbpi OS game codes

## First very crude version, current capabilities:

- takes a set of png artwork images and creates copies matching rgppi namign scheme
- creates box,ingame and title screen images
- creates USA/EUR/JAP versions, defaults to EUR if the region can't be determined
- matches names covering the majority of required correction (i.e. stripping special chars, version numbers, etc.)

## How to use:
- clone https://github.com/libretro-thumbnails/
- copy the the three Named_Titles, Named_Snaps, Named_Boxarts folders from a system of your choice (i.e. amiga) in the same folder as map.sh
- run  `sh map.sh %systemname% %outputfolder% sortedgames.dat`, note that output folder will be erased a rebuilt from scratch, systemname must match one of the system names present in the games.dat file
- renamed files are in the output folder, the need resizing for optimal display quality, imagemagik (https://imagemagick.org/index.php) is a valid option,  `mogrify -resize 300x225 *.png -quality 100` will resize all your image to fit rgbpi resolution

## Todo:
- script the creation of sortedgames.dat instead of using a prebuilt one
- cover remaining missed matches, priority on partial matches, i.e "Monstone" vs "Monstone - A Hard Days Knight" (maybe finding a more suitable artwork set will do? )
- script the resizing of images, I'm currently using Imagemagik offline
- remove hardcoded parameters and create tidy parameters input
- automate the cloning of artwork repo
- enable the matching of several systems simultaneously
