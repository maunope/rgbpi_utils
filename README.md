# rgbpi_utils
Some utilities to improve your RGB-PI OS4 (https://www.rgb-pi.com/#os) experience, not affiliated in any way with its devs

## Prerequisites:

- Root access to RGBPI is required for all utils, you can use rgbpi_extras to get it (https://github.com/sd2cv/RGBPi-Extra/)

## artwork_matcher

- a tool to match artwork sets to RGBPI OS game ids, filling gaps in OS4's built in artwork set
- creates box,ingame and title screen images
- creates USA/EUR/JAP versions, defaults to EUR if the region can't be determined
- matches names covering the majority of required correction (i.e. stripping special chars, version numbers, etc.)
- can use a lookup file to enhance the mappin of image filenames and games.dat rom filenames

## joystick_order_fix

- a script to fix "swapped joysticks" issue when using RGBPI Jamma card: Joystick 1 and Joystick 2 are seldom swapped at boot, often making "game menu" button unusable, this script addresses this issue. 
- **ONLY USE  with RGBPI Jamma cards** not tested on any other device, plus it wouldn't do anything useful :-) 




