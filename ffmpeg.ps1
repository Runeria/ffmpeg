$t=0 # Nombre de tentatives
$rep = read-host "Nom et lien " # Demande du nom du streameur et du lien
$path="path\to\download\stream"
$name,$link = $rep.split(' ') # On scinde le nom et le lien en 2 variables
$inside =  Select-String -Quiet -Pattern "$rep" -Path ffmpeg.txt
if (-not $inside) # S'il n'est pas dedans
{
	Add-Content -Path ffmpeg.txt -Value "$rep" # L'inscrire
}

while($t -lt 150000) # Au cas où le stream se coupe et se relance suite à une mauvaise connexion. On évite les relances manuelles
{
	$heure = Get-Date -UFormat "%Hh%Mm%Ss" # L'heure à laquelle le stream commence
	path\to\ffmpeg.exe -i $link -c copy -bsf:a aac_adtstoasc $path\$name"_"$heure.mp4 # Vidéo téléchargée prendra le nom du streameur et l'heure
	$t++ # Tentative +1
	Write-Host $t Tentatives
	Write-Host Recherche de $name
}