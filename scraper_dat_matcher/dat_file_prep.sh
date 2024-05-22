#given a libretro dat file in this format:
# game (
#	name "'99: The Last War (bootleg)"
#	year "1985"
#	publisher "bootleg"
#	rom ( name 99lstwarb.zip size 79178 crc A655DA90 md5 45e9997ef780cacada973cc4330f7099 sha1 0394a96955499afa9642e7fa1895878603a64480 )
# )
#
#outputs a pipe separated file in this format:
#
# '99: The Last War (bootleg)|1985|bootleg|A655DA90|
#
#

#!/bin/bash
InputFile="$1"
OutputFile="$2"

echo "name,year,publisher,filename,crc" > "$OutputFile"



while read -r Line; do

    if [[ -z "$Line" ]]; then
        # Output the collected rom data
        echo "$FileName|$Name|$Year|$Publisher|$Crc" >> "$OutputFile"
        continue
    fi
        
    if [[ $Line =~ ^name ]]; then
        Name=$(echo "$Line" | awk -F '"' '{for(i=2;i<=NF;i+=2) print $i}')
    elif [[ $Line =~ ^year ]]; then
        Year=$(echo "$Line" | awk -F '"' '{for(i=2;i<=NF;i+=2) print $i}')
    elif [[ $Line =~ ^publisher  ||  $Line =~ ^developer ]]; then
        Publisher=$(echo "$Line" | awk -F '"' '{for(i=2;i<=NF;i+=2) print $i}')
    elif [[ $Line =~ ^rom  ]]; then
        # Extract the name (between "name" and "size")
        FileName=$(echo "$Line" | awk -F'name | size' '{print $2}' | tr -d ' ') 
        # Extract the CRC (between "crc" and "md5")
        Crc=$(echo "$Line" | awk -F'crc | md5' '{print $2}' | tr -d ' ')
    fi
done < "$InputFile"

echo "CSV file 'games.csv' created successfully!"
