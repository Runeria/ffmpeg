#!/bin/bash
t=0 # Nombre de tentatives
path="/path/to/save/download"
read -p "Nom et lien : " rep # Demande du nom et du lien
if ! grep -Fxq "$req" ffmpeg.txt ; then echo "
$rep" >> ffmpeg.txt ; fi # On enregistre dans un fichier annexe le nom et le lien du streameur s'il n'est pas déjà
IFS=" " read name link <<< $rep # On scinde le nom et le lien en 2 variables
while [$t -lt 150000] # Au cas où le stream se coupe et se relance suite à une mauvaise connexion. On évite les relances manuelles
do
  heure=$(date +%Hh%Mm%S) # L'heure à laquelle le stream commence
  ffmpeg -i "$link" -bsf:a aac_adtstoasc -vcodec copy -c copy -crf 50 $path/$name"_"$heure.mp4 # Vidéo téléchargée prendra le nom du streameur et l'heure
  t=$(($t+1)) # Tentative +1
  echo "$t tentatives"
  echo "recherche de $name"
  sleep 1 # Attente de 1 seconde
done