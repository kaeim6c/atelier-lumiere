$ErrorActionPreference = "Stop"

$destination = "C:\Users\Karim\Desktop\atelier-lumiere\assets\images"
New-Item -ItemType Directory -Force -Path $destination | Out-Null

$images = @(
    @{ Id = 1015; Nom = "hero-accueil"; Largeur = 1280; Hauteur = 720 },
    @{ Id = 1011; Nom = "montagne-enneigee"; Largeur = 640; Hauteur = 480 },
    @{ Id = 1012; Nom = "foret-brume"; Largeur = 640; Hauteur = 480 },
    @{ Id = 1013; Nom = "lac-vue-aerienne"; Largeur = 640; Hauteur = 480 },
    @{ Id = 1016; Nom = "lac-montagne"; Largeur = 640; Hauteur = 480 },
    @{ Id = 1018; Nom = "riviere-foret"; Largeur = 640; Hauteur = 480 },
    @{ Id = 1019; Nom = "ville-vue-du-ciel"; Largeur = 640; Hauteur = 480 },
    @{ Id = 1020; Nom = "paysage-rural"; Largeur = 640; Hauteur = 480 },
    @{ Id = 1021; Nom = "foret-automne"; Largeur = 640; Hauteur = 480 },
    @{ Id = 1022; Nom = "route-desert"; Largeur = 640; Hauteur = 480 },
    @{ Id = 1023; Nom = "plage-soleil"; Largeur = 640; Hauteur = 480 },
    @{ Id = 1024; Nom = "animal-paysage"; Largeur = 640; Hauteur = 480 },
    @{ Id = 1025; Nom = "ciel-nuages"; Largeur = 640; Hauteur = 480 },
    @{ Id = 1026; Nom = "nuages"; Largeur = 640; Hauteur = 480 },
    @{ Id = 1027; Nom = "coucher-soleil"; Largeur = 640; Hauteur = 480 },
    @{ Id = 1028; Nom = "montagnes-lointaines"; Largeur = 640; Hauteur = 480 },
    @{ Id = 1029; Nom = "foret-dense"; Largeur = 640; Hauteur = 480 },
    @{ Id = 1031; Nom = "paysage-riviere"; Largeur = 640; Hauteur = 480 },
    @{ Id = 1032; Nom = "lac-calme"; Largeur = 640; Hauteur = 480 },
    @{ Id = 1033; Nom = "paysage-rocheux"; Largeur = 640; Hauteur = 480 },
    @{ Id = 1035; Nom = "animal-neige"; Largeur = 640; Hauteur = 480 },
    @{ Id = 1036; Nom = "riviere-montagne"; Largeur = 640; Hauteur = 480 },
    @{ Id = 1037; Nom = "fleurs-ciel"; Largeur = 640; Hauteur = 480 },
    @{ Id = 1038; Nom = "village-montagne"; Largeur = 640; Hauteur = 480 },
    @{ Id = 1039; Nom = "vallee-coucher-soleil"; Largeur = 640; Hauteur = 480 },
    @{ Id = 1040; Nom = "actualite-monts-arree"; Largeur = 640; Hauteur = 400 },
    @{ Id = 1041; Nom = "actualite-littoral"; Largeur = 640; Hauteur = 400 },
    @{ Id = 1042; Nom = "actualite-ville"; Largeur = 640; Hauteur = 400 }
)

$total = $images.Count
$succes = 0
$erreurs = 0

for ($index = 0; $index -lt $total; $index++) {
    $image = $images[$index]
    $url = "https://picsum.photos/id/$($image.Id)/$($image.Largeur)/$($image.Hauteur)"
    $fichier = Join-Path $destination "$($image.Nom).jpg"

    Write-Progress -Activity "Téléchargement des images de l'accueil" -Status "$($index + 1) / $total : $($image.Nom)" -PercentComplete ((($index + 1) / $total) * 100)

    try {
        Invoke-WebRequest -Uri $url -OutFile $fichier -UseBasicParsing
        $tailleKo = [math]::Round((Get-Item $fichier).Length / 1KB, 1)
        Write-Host "OK  $($image.Nom).jpg ($tailleKo Ko)" -ForegroundColor Green
        $succes++
    }
    catch {
        Write-Host "ERREUR  $($image.Nom) : $($_.Exception.Message)" -ForegroundColor Red
        $erreurs++
    }
}

Write-Progress -Activity "Téléchargement des images de l'accueil" -Completed
Write-Host ""
Write-Host "Terminé : $succes image(s) téléchargée(s), $erreurs erreur(s)." -ForegroundColor Cyan
Write-Host "Dossier cible : $destination" -ForegroundColor Cyan
