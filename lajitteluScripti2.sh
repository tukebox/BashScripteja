#!/bin/bash

read -p 'Anna tiedostotyyppi: ' tyyppi

for file in $(find . -name "*.$tyyppi")
do
   date=$(stat -c %y $file)
   year=${date:0:4}
   month=${date:5:2}

   if [ ! -d "$year" ]; then
      mkdir "$year"
   fi

   if [ ! -d "$year"/"$year-$month" ]; then
      mkdir "$year"/"$year-$month"
   fi

# siirretään tiedostot oikeaan kansioon
   mv $file "$year"/"$year-$month"

done
