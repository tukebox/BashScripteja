#!/bin/bash

# SKRIPTI TIEDOSTOJEN LAJITTELUUN KUUKAUDEN JA VUODEN MUKAAN JONA NE OVAT LUOTU
# Skripti luo oman kansion jokaiselle vuodelle ja sen sisään kansion jokaiselle
# kuukaudelle ja siirtää tiedostot kansioihin

# Sopii hyvin vaikkapa videoiden ja kuvien lajitteluun

# skriptille syötetään tiedostomuoto (esim. jpg, mp4...)
# Skriptin täytyy sijaita samassa hakemistossa kuin tiedostot, jotka halutaan lajitella
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
