$ErrorActionPreference = "Stop"

New-Item -ItemType Directory -Force -Path `
  ".\assets\css", `
  ".\assets\js", `
  ".\assets\images", `
  ".\docs\notes" | Out-Null

$style = @'
@import url("https://fonts.googleapis.com/css2?family=Archivo+Expanded:wght@500;600;700;800&family=Archivo:wght@400;500;600;700&family=Source+Sans+3:wght@300;400;500;600;700&family=Caveat:wght@500;600&family=Playfair+Display:wght@400;600;700&display=swap");
@import url("https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css");

:root {
  --noir: #15151d;
  --sombre: #27212c;
  --creme: #f7f2eb;
  --beige: #e8ddcf;
  --or: #c88c45;
  --rose: #c65b67;
  --blanc: #ffffff;
  --gris: #666;
  --bordure: #d8cec1;
  --ombre: 0 18px 45px rgba(35, 22, 15, .18);
}

* {
  box-sizing: border-box;
}

html {
  scroll-behavior: smooth;
}

body {
  margin: 0;
  color: var(--noir);
  background: var(--creme);
  font-family: "Source Sans 3", Arial, sans-serif;
  font-size: 17px;
  line-height: 1.55;
}

h1, h2, h3, h4 {
  font-family: "Archivo Expanded", "Archivo", Arial, sans-serif;
  line-height: 1.15;
}

h1 {
  font-size: clamp(2.5rem, 5vw, 4.8rem);
  margin: 0 0 1.5rem;
}

h2 {
  font-size: clamp(1.9rem, 3vw, 3rem);
  margin-top: 0;
}

h3 {
  font-size: 1.3rem;
  margin-top: 0;
}

a {
  color: inherit;
}

img {
  max-width: 100%;
}

.site-header {
  position: sticky;
  top: 0;
  z-index: 20;
  color: var(--blanc);
  background: rgba(21, 21, 29, .96);
  border-bottom: 1px solid rgba(255, 255, 255, .16);
  backdrop-filter: blur(12px);
}

.header-inner,
.conteneur {
  width: min(1320px, calc(100% - 40px));
  margin: 0 auto;
}

.header-inner {
  display: flex;
  flex-wrap: wrap;
  gap: 20px;
  align-items: center;
  justify-content: space-between;
  padding: 16px 0;
}

.logo {
  color: var(--blanc);
  font-family: "Playfair Display", serif;
  font-size: 1.7rem;
  font-weight: 700;
  letter-spacing: .03em;
  text-decoration: none;
}

.logo span {
  color: var(--or);
  font-family: "Caveat", cursive;
  font-size: 2rem;
}

.nav-principale ul {
  display: flex;
  flex-wrap: wrap;
  gap: 18px;
  margin: 0;
  padding: 0;
  list-style: none;
}

.nav-principale a {
  color: var(--blanc);
  font-weight: 700;
  text-decoration: none;
}

.nav-principale a:hover,
.nav-principale a:focus {
  color: var(--or);
}

.bande-info {
  color: var(--blanc);
  background: var(--rose);
  font-size: .9rem;
  font-weight: 700;
  text-align: center;
  padding: 8px 16px;
}

.hero {
  position: relative;
  min-height: 730px;
  overflow: hidden;
  color: var(--blanc);
  background: #20181a;
}

.hero::before {
  position: absolute;
  inset: 0;
  background: linear-gradient(90deg, rgba(13, 11, 17, .92) 8%, rgba(13, 11, 17, .58) 52%, rgba(13, 11, 17, .22));
  content: "";
  z-index: 1;
}

.hero-image {
  position: absolute;
  width: 100%;
  height: 100%;
  inset: 0;
  object-fit: cover;
  transform: scale(1.03);
  filter: saturate(1.18) contrast(1.06);
}

.hero-contenu {
  position: relative;
  z-index: 2;
  width: min(760px, 100%);
  padding: 160px 0 130px;
}

.hero p {
  max-width: 650px;
  color: #f4e8dc;
  font-size: 1.25rem;
}

.bouton,
button,
input[type="submit"] {
  display: inline-block;
  border: 0;
  border-radius: 4px;
  color: var(--blanc);
  background: var(--rose);
  box-shadow: 0 8px 16px rgba(0, 0, 0, .18);
  cursor: pointer;
  font: inherit;
  font-weight: 800;
  padding: 15px 22px;
  text-decoration: none;
}

.bouton.secondaire {
  color: var(--noir);
  background: var(--blanc);
}

.section {
  padding: 84px 0;
}

.section-foncee {
  color: var(--blanc);
  background: var(--sombre);
}

.section-titre {
  display: flex;
  flex-wrap: wrap;
  align-items: end;
  justify-content: space-between;
  gap: 20px;
  margin-bottom: 36px;
}

.section-titre p {
  max-width: 650px;
  margin: 0;
  color: var(--gris);
}

.section-foncee .section-titre p {
  color: #ddd5cd;
}

.grille-3,
.grille-4,
.grille-actualites,
.grille-temoignages,
.grille-produits {
  display: grid;
  gap: 24px;
}

.grille-3 {
  grid-template-columns: repeat(3, 1fr);
}

.grille-4 {
  grid-template-columns: repeat(4, 1fr);
}

.grille-actualites {
  grid-template-columns: repeat(3, 1fr);
}

.grille-temoignages {
  grid-template-columns: repeat(3, 1fr);
}

.grille-produits {
  grid-template-columns: repeat(4, 1fr);
}

.carte,
.carte-produit,
.carte-actu,
.temoignage,
.faq-item,
.formulaire-bloc {
  overflow: hidden;
  border: 1px solid var(--bordure);
  border-radius: 8px;
  background: var(--blanc);
  box-shadow: var(--ombre);
}

.carte {
  padding: 28px;
}

.carte i {
  display: inline-flex;
  width: 54px;
  height: 54px;
  align-items: center;
  justify-content: center;
  margin-bottom: 18px;
  border-radius: 50%;
  color: var(--blanc);
  background: var(--or);
  font-size: 1.3rem;
}

.carte p,
.carte-actu p,
.carte-produit p,
.temoignage p {
  color: #555;
}

.carte-actu img,
.carte-produit img {
  display: block;
  width: 100%;
  height: 320px;
  object-fit: cover;
}

.carte-actu .contenu,
.carte-produit .contenu {
  padding: 22px;
}

.prix {
  color: var(--rose);
  font-family: "Archivo Expanded", sans-serif;
  font-size: 1.2rem;
  font-weight: 800;
}

.galerie {
  display: grid;
  grid-template-columns: repeat(4, 1fr);
  gap: 16px;
}

.galerie img {
  display: block;
  width: 100%;
  height: 340px;
  border-radius: 5px;
  object-fit: cover;
  box-shadow: var(--ombre);
}

.bande-chiffres {
  color: var(--blanc);
  background: linear-gradient(120deg, #2a1c21, #8f454f);
  padding: 54px 0;
}

.chiffres {
  display: grid;
  grid-template-columns: repeat(4, 1fr);
  gap: 30px;
  text-align: center;
}

.chiffre {
  display: block;
  color: #ffdca7;
  font-family: "Archivo Expanded", sans-serif;
  font-size: 3.4rem;
  font-weight: 800;
}

.chiffres span:last-child {
  font-size: .95rem;
}

.temoignage {
  padding: 26px;
}

.temoignage blockquote {
  margin: 0;
  font-family: "Playfair Display", serif;
  font-size: 1.18rem;
}

.temoignage cite {
  display: block;
  margin-top: 16px;
  color: var(--rose);
  font-style: normal;
  font-weight: 800;
}

.faq {
  display: grid;
  gap: 14px;
}

.faq-item {
  padding: 25px;
}

.faq-item h3 {
  color: var(--rose);
}

.bande-partenaires {
  overflow: hidden;
  color: var(--blanc);
  background: #111118;
  padding: 28px 0;
}

.piste-partenaires {
  display: flex;
  width: max-content;
  gap: 70px;
  animation: defilement-partenaires 22s linear infinite;
  font-family: "Archivo Expanded", sans-serif;
  font-size: 1.15rem;
  font-weight: 800;
}

.piste-partenaires span {
  min-width: 180px;
  color: #f2d3a6;
  text-align: center;
}

.video {
  position: relative;
  aspect-ratio: 16 / 9;
  overflow: hidden;
  border-radius: 8px;
  box-shadow: var(--ombre);
}

.video iframe {
  width: 100%;
  height: 100%;
  border: 0;
}

.page-entete {
  color: var(--blanc);
  background: linear-gradient(125deg, #17131c, #55313a);
  padding: 92px 0;
}

.page-entete p {
  max-width: 720px;
  color: #f1e2d5;
  font-size: 1.15rem;
}

.formulaire-bloc {
  padding: 32px;
}

.champ {
  margin-bottom: 22px;
}

.champ label {
  display: block;
  margin-bottom: 7px;
  font-weight: 800;
}

.champ input,
.champ textarea,
.champ select {
  width: 100%;
  border: 1px solid #b7aa9e;
  border-radius: 4px;
  background: #fffdf9;
  font: inherit;
  padding: 13px;
}

.zone-upload {
  margin: 20px 0;
  border: 3px dashed var(--or);
  border-radius: 8px;
  background: #fff8ed;
  cursor: pointer;
  padding: 45px 22px;
  text-align: center;
}

.zone-upload i {
  display: block;
  margin-bottom: 12px;
  color: var(--rose);
  font-size: 2.2rem;
}

.liste-fichiers {
  display: grid;
  gap: 12px;
  margin-top: 16px;
}

.fichier-item {
  display: flex;
  gap: 12px;
  align-items: center;
  justify-content: space-between;
  border: 1px solid var(--bordure);
  background: #fff;
  padding: 12px;
}

.fichier-item img {
  width: 70px;
  height: 70px;
  object-fit: cover;
}

.supprimer {
  border: 0;
  color: #fff;
  background: var(--rose);
  cursor: pointer;
  padding: 8px;
}

.etapes {
  display: flex;
  gap: 10px;
  margin-bottom: 35px;
}

.etape {
  flex: 1;
  border-radius: 4px;
  color: #6b5e52;
  background: #e7ded5;
  font-size: .85rem;
  font-weight: 800;
  padding: 12px;
  text-align: center;
}

.etape.active {
  color: var(--blanc);
  background: var(--rose);
}

.message-confirmation {
  border: 2px solid #5a8c5a;
  border-radius: 8px;
  background: #f0f7ed;
  padding: 30px;
}

#map {
  width: 100%;
  height: 500px;
  margin: 25px 0;
  border: 10px solid var(--blanc);
  box-shadow: var(--ombre);
}

.site-footer {
  color: #d9d1cc;
  background: #15151d;
  padding: 70px 0 28px;
}

.footer-grille {
  display: grid;
  grid-template-columns: 2fr 1fr 1fr 1fr;
  gap: 32px;
}

.site-footer a {
  color: #d9d1cc;
  text-decoration: none;
}

.site-footer ul {
  margin: 0;
  padding: 0;
  list-style: none;
}

.site-footer li {
  margin: 9px 0;
}

.footer-bas {
  margin-top: 45px;
  border-top: 1px solid #46414a;
  color: #a7a1a9;
  font-size: .9rem;
  padding-top: 22px;
}

@keyframes defilement-partenaires {
  from { transform: translateX(0); }
  to { transform: translateX(-50%); }
}

@media (max-width: 960px) {
  .grille-4,
  .grille-produits,
  .galerie,
  .chiffres {
    grid-template-columns: repeat(2, 1fr);
  }

  .grille-3,
  .grille-actualites,
  .grille-temoignages,
  .footer-grille {
    grid-template-columns: 1fr 1fr;
  }
}

@media (max-width: 640px) {
  .grille-4,
  .grille-3,
  .grille-produits,
  .grille-actualites,
  .grille-temoignages,
  .galerie,
  .chiffres,
  .footer-grille {
    grid-template-columns: 1fr;
  }

  .hero {
    min-height: 640px;
  }

  .hero-contenu {
    padding: 115px 0 95px;
  }

  .section {
    padding: 58px 0;
  }
}
'@

$animations = @'
/* Feuille chargée globalement : animations décoratives non essentielles. */

.hero-image {
  animation: respiration-image 8s ease-in-out infinite alternate;
}

.carte,
.carte-produit,
.carte-actu,
.temoignage {
  transition: transform .4s ease, box-shadow .4s ease;
}

.carte:hover,
.carte-produit:hover,
.carte-actu:hover,
.temoignage:hover {
  transform: translateY(-10px) scale(1.015);
  box-shadow: 0 32px 65px rgba(28, 14, 10, .25);
}

.pastille-decoration {
  position: absolute;
  border-radius: 50%;
  opacity: .55;
  animation: flottement 7s ease-in-out infinite alternate;
}

.pastille-decoration.un {
  width: 180px;
  height: 180px;
  top: 130px;
  right: 8%;
  background: #e2a85b;
}

.pastille-decoration.deux {
  width: 90px;
  height: 90px;
  right: 28%;
  bottom: 80px;
  background: #cf6672;
  animation-delay: 1.5s;
}

@keyframes respiration-image {
  from { transform: scale(1.03) rotate(0deg); }
  to { transform: scale(1.1) rotate(.5deg); }
}

@keyframes flottement {
  from { transform: translateY(0) rotate(0deg); }
  to { transform: translateY(-24px) rotate(12deg); }
}
'@

$appJs = @'
/*
  Baseline pédagogique volontairement non optimisée.
  Ce script est chargé sur toutes les pages, quelle que soit la fonctionnalité.
*/

document.addEventListener("DOMContentLoaded", () => {
  const tousLesElements = document.querySelectorAll("*");

  tousLesElements.forEach((element, index) => {
    element.dataset.initialise = "true";
    element.dataset.positionGlobale = index;
  });

  document.querySelectorAll("[data-compteur]").forEach((element) => {
    let valeur = Number(element.dataset.compteur) || 0;

    setInterval(() => {
      valeur += Math.floor(Math.random() * 4) + 1;
      element.textContent = valeur.toLocaleString("fr-FR");
    }, 2000);
  });

  const titreOriginal = document.title;

  setInterval(() => {
    const maintenant = new Date().toLocaleTimeString("fr-FR");
    document.title = `${titreOriginal} — ${maintenant}`;
  }, 1000);

  document.querySelectorAll("form").forEach((formulaire) => {
    formulaire.addEventListener("submit", () => {
      console.log("Formulaire soumis", new Date().toISOString());
    });
  });
});
'@

$galleryJs = @'
/* Script chargé sur toutes les pages, même sans galerie. */
document.addEventListener("DOMContentLoaded", () => {
  const images = document.querySelectorAll(".galerie img, .carte-produit img, .carte-actu img");

  images.forEach((image) => {
    image.addEventListener("load", () => {
      image.dataset.imageChargee = "oui";
      console.log("Image chargée :", image.currentSrc || image.src);
    });

    image.addEventListener("click", () => {
      const overlay = document.createElement("div");
      overlay.style.position = "fixed";
      overlay.style.inset = "0";
      overlay.style.zIndex = "100";
      overlay.style.background = "rgba(0,0,0,.88)";
      overlay.style.display = "flex";
      overlay.style.alignItems = "center";
      overlay.style.justifyContent = "center";
      overlay.style.padding = "30px";

      const grandeImage = document.createElement("img");
      grandeImage.src = image.src;
      grandeImage.alt = image.alt;
      grandeImage.style.maxHeight = "90vh";
      grandeImage.style.maxWidth = "90vw";
      grandeImage.style.objectFit = "contain";

      overlay.appendChild(grandeImage);
      overlay.addEventListener("click", () => overlay.remove());
      document.body.appendChild(overlay);
    });
  });
});
'@

$carouselJs = @'
/* Carrousel automatique décoratif. */
document.addEventListener("DOMContentLoaded", () => {
  const carrousel = document.querySelector("[data-carrousel]");
  if (!carrousel) return;

  const cartes = carrousel.querySelectorAll(".carte-actu");
  let index = 0;

  setInterval(() => {
    index = (index + 1) % cartes.length;

    cartes.forEach((carte, position) => {
      carte.style.opacity = position === index ? "1" : ".55";
      carte.style.transform = position === index ? "scale(1.02)" : "scale(.98)";
    });
  }, 3200);
});
'@

$uploadJs = @'
/* Aperçu de fichiers volontairement coûteux : lecture base64 complète. */
document.addEventListener("DOMContentLoaded", () => {
  const zone = document.querySelector(".zone-upload");
  const input = document.querySelector("#documents");
  const liste = document.querySelector(".liste-fichiers");

  if (!zone || !input || !liste) return;

  zone.addEventListener("click", () => input.click());

  input.addEventListener("change", (event) => {
    Array.from(event.target.files).forEach((fichier) => {
      const item = document.createElement("div");
      item.className = "fichier-item";
      item.innerHTML = `
        <div>
          <strong>${fichier.name}</strong><br>
          ${(fichier.size / 1024 / 1024).toFixed(2)} Mo
        </div>
        <button class="supprimer" type="button">Supprimer</button>
      `;

      const lecteur = new FileReader();

      lecteur.onload = (resultat) => {
        if (fichier.type.startsWith("image/")) {
          const apercu = document.createElement("img");
          apercu.src = resultat.target.result;
          apercu.alt = `Aperçu de ${fichier.name}`;
          item.prepend(apercu);
        }

        item.querySelector(".supprimer").addEventListener("click", () => item.remove());
      };

      lecteur.readAsDataURL(fichier);
      liste.appendChild(item);
    });
  });
});
'@

$analyticsJs = @'
/* Faux indicateurs décoratifs, sans collecte ni envoi de données. */
document.addEventListener("DOMContentLoaded", () => {
  const zoneStatut = document.querySelector("[data-statut-activite]");
  let tour = 0;

  setInterval(() => {
    tour += 1;

    if (zoneStatut) {
      zoneStatut.textContent = `Actualisation de l'activité ${tour}`;
    }

    document.querySelectorAll(".carte, .carte-produit, .carte-actu").forEach((carte) => {
      carte.dataset.dernierControle = Date.now();
    });

    console.log("Contrôle analytique décoratif", tour);
  }, 2500);
});
'@

$mapJs = @'
/* Ce script est chargé globalement ; la carte est initialisée si #map existe. */
document.addEventListener("DOMContentLoaded", () => {
  const conteneur = document.querySelector("#map");

  if (!conteneur || typeof L === "undefined") return;

  const carte = L.map("map").setView([48.1173, -1.6778], 13);

  L.tileLayer("https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png", {
    attribution: "&copy; OpenStreetMap contributors"
  }).addTo(carte);

  L.marker([48.1173, -1.6778])
    .addTo(carte)
    .bindPopup("Atelier Lumière — Rennes")
    .openPopup();
});
'@

$index = @'
<!DOCTYPE html>
<html lang="fr">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Atelier Lumière — Photographe à Rennes</title>
  <meta name="description" content="Portfolio, tirages et prestations du photographe Atelier Lumière à Rennes.">
  <link rel="stylesheet" href="assets/css/style.css">
  <link rel="stylesheet" href="assets/css/animations.css">
</head>
<body>
  <div class="bande-info">Offre de saison : livraison offerte dès 90 € — <span data-statut-activite>activité en cours</span></div>

  <header class="site-header">
    <div class="header-inner">
      <a class="logo" href="index.html">Atelier <span>Lumière</span></a>
      <nav class="nav-principale" aria-label="Navigation principale">
        <ul>
          <li><a href="index.html">Portfolio</a></li>
          <li><a href="boutique.html">Boutique</a></li>
          <li><a href="candidature.html">Candidater</a></li>
          <li><a href="contact.html">Contact</a></li>
        </ul>
      </nav>
    </div>
  </header>

  <main>
    <section class="hero">
      <img class="hero-image" src="https://picsum.photos/id/1015/2400/1500" alt="Paysage montagne photographié au lever du jour">
      <span class="pastille-decoration un"></span>
      <span class="pastille-decoration deux"></span>
      <div class="conteneur hero-contenu">
        <p>Photographe indépendant à Rennes</p>
        <h1>Des images qui racontent vos histoires.</h1>
        <p>Portrait, reportage, mariage, architecture et paysages : découvrez un regard sensible sur les instants importants et les territoires qui nous entourent.</p>
        <a class="bouton" href="boutique.html">Découvrir les tirages</a>
        <a class="bouton secondaire" href="contact.html">Prendre contact</a>
      </div>
    </section>

    <section class="section">
      <div class="conteneur">
        <div class="section-titre">
          <div>
            <p>Portfolio</p>
            <h2>Une sélection de reportages récents</h2>
          </div>
          <p>Cette galerie présente volontairement de nombreuses images chargées en haute définition dès l’ouverture de la page.</p>
        </div>

        <div class="galerie">
          <img src="https://picsum.photos/id/1011/1600/1200" alt="Montagne enneigée">
          <img src="https://picsum.photos/id/1012/1600/1200" alt="Forêt dans la brume">
          <img src="https://picsum.photos/id/1013/1600/1200" alt="Vue aérienne d'un lac">
          <img src="https://picsum.photos/id/1016/1600/1200" alt="Lac et montagne">
          <img src="https://picsum.photos/id/1018/1600/1200" alt="Rivière dans une forêt">
          <img src="https://picsum.photos/id/1019/1600/1200" alt="Ville vue du ciel">
          <img src="https://picsum.photos/id/1020/1600/1200" alt="Paysage rural">
          <img src="https://picsum.photos/id/1021/1600/1200" alt="Forêt en automne">
          <img src="https://picsum.photos/id/1022/1600/1200" alt="Route dans le désert">
          <img src="https://picsum.photos/id/1023/1600/1200" alt="Plage au soleil">
          <img src="https://picsum.photos/id/1024/1600/1200" alt="Animal devant un paysage">
          <img src="https://picsum.photos/id/1025/1600/1200" alt="Ciel et nuages">
          <img src="https://picsum.photos/id/1026/1600/1200" alt="Nuages dans le ciel">
          <img src="https://picsum.photos/id/1027/1600/1200" alt="Coucher de soleil">
          <img src="https://picsum.photos/id/1028/1600/1200" alt="Montagnes lointaines">
          <img src="https://picsum.photos/id/1029/1600/1200" alt="Forêt dense">
          <img src="https://picsum.photos/id/1031/1600/1200" alt="Paysage avec rivière">
          <img src="https://picsum.photos/id/1032/1600/1200" alt="Lac calme">
          <img src="https://picsum.photos/id/1033/1600/1200" alt="Paysage rocheux">
          <img src="https://picsum.photos/id/1035/1600/1200" alt="Animal dans la neige">
          <img src="https://picsum.photos/id/1036/1600/1200" alt="Rivière de montagne">
          <img src="https://picsum.photos/id/1037/1600/1200" alt="Fleurs et ciel">
          <img src="https://picsum.photos/id/1038/1600/1200" alt="Village en montagne">
          <img src="https://picsum.photos/id/1039/1600/1200" alt="Vallée au coucher du soleil">
        </div>
      </div>
    </section>

    <section class="bande-chiffres">
      <div class="conteneur chiffres">
        <div><strong class="chiffre" data-compteur="482">482</strong><span>reportages réalisés</span></div>
        <div><strong class="chiffre" data-compteur="1260">1260</strong><span>tirages expédiés</span></div>
        <div><strong class="chiffre" data-compteur="38">38</strong><span>lieux photographiés</span></div>
        <div><strong class="chiffre" data-compteur="912">912</strong><span>heures de retouche</span></div>
      </div>
    </section>

    <section class="section section-foncee">
      <div class="conteneur">
        <div class="section-titre">
          <div>
            <p>Prestations</p>
            <h2>Des services pour tous vos projets</h2>
          </div>
        </div>

        <div class="grille-4">
          <article class="carte">
            <i class="fa-solid fa-camera-retro"></i>
            <h3>Portraits</h3>
            <p>Des portraits personnels, professionnels ou éditoriaux, en studio et en extérieur.</p>
          </article>
          <article class="carte">
            <i class="fa-solid fa-heart"></i>
            <h3>Mariages</h3>
            <p>Une présence discrète pour documenter les préparatifs, la cérémonie et la fête.</p>
          </article>
          <article class="carte">
            <i class="fa-solid fa-building"></i>
            <h3>Architecture</h3>
            <p>Des images pour valoriser les lieux, les matières, les usages et les projets urbains.</p>
          </article>
          <article class="carte">
            <i class="fa-solid fa-mountain-sun"></i>
            <h3>Paysages</h3>
            <p>Des tirages d’art et reportages réalisés entre Bretagne, littoral et massifs français.</p>
          </article>
        </div>
      </div>
    </section>

    <section class="section">
      <div class="conteneur">
        <div class="section-titre">
          <div>
            <p>Journal</p>
            <h2>Dernières actualités de l’atelier</h2>
          </div>
          <p>Ces contenus secondaires sont affichés et leurs images sont chargées dès l’arrivée sur la page.</p>
        </div>

        <div class="grille-actualites" data-carrousel>
          <article class="carte-actu">
            <img src="https://picsum.photos/id/1040/1800/1200" alt="Forêt photographiée en hiver">
            <div class="contenu">
              <h3>Une semaine dans les Monts d’Arrée</h3>
              <p>Retour en images sur une série de paysages réalisés au petit matin.</p>
            </div>
          </article>
          <article class="carte-actu">
            <img src="https://picsum.photos/id/1041/1800/1200" alt="Littoral rocheux">
            <div class="contenu">
              <h3>Préparer un reportage sur le littoral</h3>
              <p>Lumière, météo, marées et repérages : les coulisses d’une commande.</p>
            </div>
          </article>
          <article class="carte-actu">
            <img src="https://picsum.photos/id/1042/1800/1200" alt="Rue de ville">
            <div class="contenu">
              <h3>Photographier la ville au lever du jour</h3>
              <p>Une série urbaine réalisée avant l’ouverture des commerces.</p>
            </div>
          </article>
        </div>
      </div>
    </section>

    <section class="section">
      <div class="conteneur">
        <div class="section-titre">
          <div>
            <p>Témoignages</p>
            <h2>Ils ont travaillé avec Atelier Lumière</h2>
          </div>
        </div>

        <div class="grille-temoignages">
          <article class="temoignage"><blockquote>« Des images très justes, une présence rassurante et un résultat au-delà de nos attentes. »</blockquote><cite>— Claire et Martin</cite></article>
          <article class="temoignage"><blockquote>« Le reportage architectural a apporté une nouvelle visibilité à notre projet de rénovation. »</blockquote><cite>— Agence Kerne</cite></article>
          <article class="temoignage"><blockquote>« Chaque portrait raconte quelque chose sans jamais forcer la pose ou l’expression. »</blockquote><cite>— Sophie L.</cite></article>
          <article class="temoignage"><blockquote>« Une grande disponibilité, y compris pendant les préparatifs et les imprévus du mariage. »</blockquote><cite>— Léa et Thomas</cite></article>
          <article class="temoignage"><blockquote>« Les tirages reçus sont magnifiques et parfaitement emballés. »</blockquote><cite>— Camille R.</cite></article>
          <article class="temoignage"><blockquote>« Un regard singulier sur la Bretagne et sur les lieux que nous pensions déjà connaître. »</blockquote><cite>— Éditions Arvor</cite></article>
        </div>
      </div>
    </section>

    <section class="section section-foncee">
      <div class="conteneur">
        <div class="section-titre">
          <div>
            <p>Questions fréquentes</p>
            <h2>Tout savoir avant de réserver</h2>
          </div>
        </div>

        <div class="faq">
          <article class="faq-item"><h3>Quels types de séances proposez-vous ?</h3><p>Les séances comprennent les portraits, reportages professionnels, mariages, événements, photographies de produits, projets éditoriaux et commandes artistiques.</p></article>
          <article class="faq-item"><h3>Comment recevoir les photographies ?</h3><p>Les livraisons numériques et les tirages sont proposés selon la prestation retenue. Les fichiers sont conservés pendant une durée indicative de six mois.</p></article>
          <article class="faq-item"><h3>Peut-on offrir une séance ?</h3><p>Oui, des cartes cadeaux sont disponibles pour les portraits, séances en extérieur ou tirages d’art, avec une durée de validité de douze mois.</p></article>
          <article class="faq-item"><h3>Intervenez-vous hors de Rennes ?</h3><p>Oui, l’atelier intervient principalement en Bretagne mais les déplacements sont possibles dans toute la France selon la nature du projet.</p></article>
          <article class="faq-item"><h3>Comment choisir un tirage ?</h3><p>Les formats, papiers et finitions sont décrits dans la boutique. Une demande de conseil peut être envoyée via le formulaire de contact.</p></article>
        </div>
      </div>
    </section>

    <section class="section">
      <div class="conteneur">
        <div class="section-titre">
          <div>
            <p>Présentation</p>
            <h2>Une vidéo pour découvrir l’univers de l’atelier</h2>
          </div>
        </div>
        <div class="video">
          <iframe src="https://www.youtube-nocookie.com/embed/Scxs7L0vhZ4?autoplay=0&rel=0" title="Vidéo de présentation Atelier Lumière" allowfullscreen></iframe>
        </div>
      </div>
    </section>

    <section class="bande-partenaires" aria-label="Partenaires">
      <div class="piste-partenaires">
        <span>Rennes Métropole</span><span>Maison des Arts</span><span>Studio Kerne</span><span>Éditions Arvor</span><span>Galerie Horizon</span><span>Breizh Events</span>
        <span>Rennes Métropole</span><span>Maison des Arts</span><span>Studio Kerne</span><span>Éditions Arvor</span><span>Galerie Horizon</span><span>Breizh Events</span>
      </div>
    </section>
  </main>

  <footer class="site-footer">
    <div class="conteneur footer-grille">
      <div><h3>Atelier Lumière</h3><p>Photographie, récits visuels et tirages d’art depuis Rennes.</p></div>
      <div><h3>Navigation</h3><ul><li><a href="index.html">Portfolio</a></li><li><a href="boutique.html">Boutique</a></li><li><a href="contact.html">Contact</a></li></ul></div>
      <div><h3>Services</h3><ul><li><a href="candidature.html">Candidater</a></li><li><a href="boutique.html">Commander un tirage</a></li><li><a href="contact.html">Demander un devis</a></li></ul></div>
      <div><h3>Suivre l’atelier</h3><ul><li><a href="#">Instagram</a></li><li><a href="#">Facebook</a></li><li><a href="#">LinkedIn</a></li></ul></div>
    </div>
    <div class="conteneur footer-bas">© 2026 Atelier Lumière — Projet pédagogique fictif d’écoconception.</div>
  </footer>

  <script src="assets/js/app.js"></script>
  <script src="assets/js/gallery.js"></script>
  <script src="assets/js/carousel.js"></script>
  <script src="assets/js/upload-preview.js"></script>
  <script src="assets/js/fake-analytics.js"></script>
  <script src="assets/js/map.js"></script>
</body>
</html>
'@

$boutique = @'
<!DOCTYPE html>
<html lang="fr">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Boutique — Atelier Lumière</title>
  <link rel="stylesheet" href="assets/css/style.css">
  <link rel="stylesheet" href="assets/css/animations.css">
</head>
<body>
  <div class="bande-info">Expédition des tirages sous 7 à 12 jours ouvrés — <span data-statut-activite>activité en cours</span></div>
  <header class="site-header">
    <div class="header-inner">
      <a class="logo" href="index.html">Atelier <span>Lumière</span></a>
      <nav class="nav-principale" aria-label="Navigation principale">
        <ul><li><a href="index.html">Portfolio</a></li><li><a href="boutique.html">Boutique</a></li><li><a href="candidature.html">Candidater</a></li><li><a href="contact.html">Contact</a></li></ul>
      </nav>
    </div>
  </header>

  <main>
    <section class="page-entete">
      <div class="conteneur">
        <p>Boutique</p>
        <h1>Des tirages pour prolonger l’émotion.</h1>
        <p>Découvrez une sélection de photographies disponibles en plusieurs formats. Tous les produits et recommandations sont affichés dès l’ouverture de cette page baseline.</p>
      </div>
    </section>

    <section class="section">
      <div class="conteneur">
        <div class="formulaire-bloc">
          <h2>Filtres de collection</h2>
          <div class="grille-4">
            <div class="champ"><label for="collection">Collection</label><select id="collection"><option>Toutes les collections</option><option>Bretagne</option><option>Montagnes</option><option>Ville</option></select></div>
            <div class="champ"><label for="format">Format</label><select id="format"><option>Tous les formats</option><option>30 × 40 cm</option><option>50 × 70 cm</option><option>70 × 100 cm</option></select></div>
            <div class="champ"><label for="couleur">Couleur dominante</label><select id="couleur"><option>Toutes</option><option>Bleu</option><option>Vert</option><option>Ocre</option></select></div>
            <div class="champ"><label for="tri">Trier</label><select id="tri"><option>Nouveautés</option><option>Prix croissant</option><option>Prix décroissant</option></select></div>
          </div>
        </div>

        <div class="section-titre" style="margin-top:48px">
          <div><p>Catalogue</p><h2>Photographies disponibles</h2></div>
          <p>12 produits chargés immédiatement, sans pagination ni filtre fonctionnel.</p>
        </div>

        <div class="grille-produits">
          <article class="carte-produit"><img src="https://picsum.photos/id/1011/1800/1300" alt="Montagne dans la brume"><div class="contenu"><h3>Brume sur les crêtes</h3><p>Collection Montagnes</p><p class="prix">45 €</p><a class="bouton" href="coordonnees.html?photo=brume-sur-les-cretes">Acheter</a></div></article>
          <article class="carte-produit"><img src="https://picsum.photos/id/1015/1800/1300" alt="Lac au lever du jour"><div class="contenu"><h3>Premier soleil</h3><p>Collection Horizons</p><p class="prix">55 €</p><a class="bouton" href="coordonnees.html?photo=premier-soleil">Acheter</a></div></article>
          <article class="carte-produit"><img src="https://picsum.photos/id/1016/1800/1300" alt="Lac de montagne"><div class="contenu"><h3>Eaux calmes</h3><p>Collection Lacs</p><p class="prix">45 €</p><a class="bouton" href="coordonnees.html?photo=eaux-calmes">Acheter</a></div></article>
          <article class="carte-produit"><img src="https://picsum.photos/id/1018/1800/1300" alt="Forêt et rivière"><div class="contenu"><h3>La clairière</h3><p>Collection Forêts</p><p class="prix">50 €</p><a class="bouton" href="coordonnees.html?photo=la-clairiere">Acheter</a></div></article>
          <article class="carte-produit"><img src="https://picsum.photos/id/1019/1800/1300" alt="Ville vue de haut"><div class="contenu"><h3>Géométrie urbaine</h3><p>Collection Villes</p><p class="prix">60 €</p><a class="bouton" href="coordonnees.html?photo=geometrie-urbaine">Acheter</a></div></article>
          <article class="carte-produit"><img src="https://picsum.photos/id/1020/1800/1300" alt="Paysage de campagne"><div class="contenu"><h3>Terres bretonnes</h3><p>Collection Bretagne</p><p class="prix">45 €</p><a class="bouton" href="coordonnees.html?photo=terres-bretonnes">Acheter</a></div></article>
          <article class="carte-produit"><img src="https://picsum.photos/id/1021/1800/1300" alt="Forêt en automne"><div class="contenu"><h3>Les sous-bois</h3><p>Collection Forêts</p><p class="prix">50 €</p><a class="bouton" href="coordonnees.html?photo=les-sous-bois">Acheter</a></div></article>
          <article class="carte-produit"><img src="https://picsum.photos/id/1022/1800/1300" alt="Route du désert"><div class="contenu"><h3>Route lointaine</h3><p>Collection Horizons</p><p class="prix">55 €</p><a class="bouton" href="coordonnees.html?photo=route-lointaine">Acheter</a></div></article>
          <article class="carte-produit"><img src="https://picsum.photos/id/1023/1800/1300" alt="Plage lumineuse"><div class="contenu"><h3>Marée basse</h3><p>Collection Littoral</p><p class="prix">45 €</p><a class="bouton" href="coordonnees.html?photo=maree-basse">Acheter</a></div></article>
          <article class="carte-produit"><img src="https://picsum.photos/id/1025/1800/1300" alt="Ciel nuageux"><div class="contenu"><h3>Ciel d’orage</h3><p>Collection Ciels</p><p class="prix">50 €</p><a class="bouton" href="coordonnees.html?photo=ciel-d-orage">Acheter</a></div></article>
          <article class="carte-produit"><img src="https://picsum.photos/id/1028/1800/1300" alt="Montagnes lointaines"><div class="contenu"><h3>Horizon bleu</h3><p>Collection Montagnes</p><p class="prix">60 €</p><a class="bouton" href="coordonnees.html?photo=horizon-bleu">Acheter</a></div></article>
          <article class="carte-produit"><img src="https://picsum.photos/id/1039/1800/1300" alt="Vallée au soleil"><div class="contenu"><h3>Fin de journée</h3><p>Collection Horizons</p><p class="prix">55 €</p><a class="bouton" href="coordonnees.html?photo=fin-de-journee">Acheter</a></div></article>
        </div>
      </div>
    </section>

    <section class="section section-foncee">
      <div class="conteneur">
        <div class="section-titre"><div><p>Suggestions</p><h2>Vous aimerez également</h2></div><p>Ces recommandations sont chargées même si l’utilisateur ne les consulte pas.</p></div>
        <div class="grille-4">
          <article class="carte-produit"><img src="https://picsum.photos/id/1031/1600/1200" alt="Rivière dans la vallée"><div class="contenu"><h3>Le cours d’eau</h3><p class="prix">45 €</p></div></article>
          <article class="carte-produit"><img src="https://picsum.photos/id/1032/1600/1200" alt="Lac en montagne"><div class="contenu"><h3>Silence</h3><p class="prix">50 €</p></div></article>
          <article class="carte-produit"><img src="https://picsum.photos/id/1033/1600/1200" alt="Rochers en montagne"><div class="contenu"><h3>La faille</h3><p class="prix">55 €</p></div></article>
          <article class="carte-produit"><img src="https://picsum.photos/id/1036/1600/1200" alt="Rivière dans les rochers"><div class="contenu"><h3>Après la pluie</h3><p class="prix">45 €</p></div></article>
          <article class="carte-produit"><img src="https://picsum.photos/id/1037/1600/1200" alt="Fleurs de montagne"><div class="contenu"><h3>Fleurs sauvages</h3><p class="prix">40 €</p></div></article>
          <article class="carte-produit"><img src="https://picsum.photos/id/1038/1600/1200" alt="Village dans la vallée"><div class="contenu"><h3>Le village</h3><p class="prix">50 €</p></div></article>
          <article class="carte-produit"><img src="https://picsum.photos/id/1040/1600/1200" alt="Forêt en hiver"><div class="contenu"><h3>Hiver doux</h3><p class="prix">45 €</p></div></article>
          <article class="carte-produit"><img src="https://picsum.photos/id/1041/1600/1200" alt="Côte rocheuse"><div class="contenu"><h3>Roches marines</h3><p class="prix">55 €</p></div></article>
        </div>
      </div>
    </section>
  </main>

  <footer class="site-footer"><div class="conteneur footer-grille"><div><h3>Atelier Lumière</h3><p>Projet pédagogique fictif.</p></div><div><h3>Navigation</h3><ul><li><a href="index.html">Accueil</a></li><li><a href="contact.html">Contact</a></li></ul></div><div><h3>Boutique</h3><ul><li><a href="#">Livraisons</a></li><li><a href="#">Retours</a></li></ul></div><div><h3>Réseaux</h3><ul><li><a href="#">Instagram</a></li><li><a href="#">Facebook</a></li></ul></div></div><div class="conteneur footer-bas">© 2026 Atelier Lumière</div></footer>

  <script src="assets/js/app.js"></script>
  <script src="assets/js/gallery.js"></script>
  <script src="assets/js/carousel.js"></script>
  <script src="assets/js/upload-preview.js"></script>
  <script src="assets/js/fake-analytics.js"></script>
  <script src="assets/js/map.js"></script>
</body>
</html>
'@

$coordonnees = @'
<!DOCTYPE html>
<html lang="fr">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Coordonnées — Atelier Lumière</title>
  <link rel="stylesheet" href="assets/css/style.css">
  <link rel="stylesheet" href="assets/css/animations.css">
</head>
<body>
  <header class="site-header"><div class="header-inner"><a class="logo" href="index.html">Atelier <span>Lumière</span></a><nav class="nav-principale"><ul><li><a href="index.html">Portfolio</a></li><li><a href="boutique.html">Boutique</a></li><li><a href="candidature.html">Candidater</a></li><li><a href="contact.html">Contact</a></li></ul></nav></div></header>
  <main>
    <section class="page-entete"><div class="conteneur"><p>Commande</p><h1>Vos coordonnées</h1><p>Vous finalisez la commande de la photographie sélectionnée dans la boutique.</p></div></section>
    <section class="section"><div class="conteneur">
      <div class="etapes"><div class="etape active">1. Coordonnées</div><div class="etape">2. Récapitulatif</div><div class="etape">3. Paiement</div></div>
      <div class="formulaire-bloc">
        <h2>Photographie sélectionnée : <span id="photo-selectionnee">chargement…</span></h2>
        <form action="recapitulatif.html" method="get">
          <input type="hidden" id="photo" name="photo">
          <div class="champ"><label for="nom">Nom complet</label><input type="text" id="nom" name="nom" required></div>
          <div class="champ"><label for="email">Adresse e-mail</label><input type="email" id="email" name="email" required></div>
          <div class="champ"><label for="telephone">Téléphone</label><input type="tel" id="telephone" name="telephone"></div>
          <div class="champ"><label for="adresse">Adresse de livraison</label><textarea id="adresse" name="adresse" rows="5" required></textarea></div>
          <div class="champ"><label for="commentaire">Commentaire de commande</label><textarea id="commentaire" name="commentaire" rows="5"></textarea></div>
          <button type="submit">Continuer vers le récapitulatif</button>
        </form>
      </div>
    </div></section>
  </main>
  <footer class="site-footer"><div class="conteneur footer-bas">© 2026 Atelier Lumière — Projet pédagogique fictif.</div></footer>
  <script>
    const params = new URLSearchParams(window.location.search);
    const photo = params.get("photo") || "photographie non définie";
    document.getElementById("photo").value = photo;
    document.getElementById("photo-selectionnee").textContent = photo.replaceAll("-", " ");
  </script>
  <script src="assets/js/app.js"></script>
  <script src="assets/js/gallery.js"></script>
  <script src="assets/js/carousel.js"></script>
  <script src="assets/js/upload-preview.js"></script>
  <script src="assets/js/fake-analytics.js"></script>
  <script src="assets/js/map.js"></script>
</body>
</html>
'@

$recapitulatif = @'
<!DOCTYPE html>
<html lang="fr">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Récapitulatif — Atelier Lumière</title>
  <link rel="stylesheet" href="assets/css/style.css">
  <link rel="stylesheet" href="assets/css/animations.css">
</head>
<body>
  <header class="site-header"><div class="header-inner"><a class="logo" href="index.html">Atelier <span>Lumière</span></a><nav class="nav-principale"><ul><li><a href="index.html">Portfolio</a></li><li><a href="boutique.html">Boutique</a></li><li><a href="candidature.html">Candidater</a></li><li><a href="contact.html">Contact</a></li></ul></nav></div></header>
  <main>
    <section class="page-entete"><div class="conteneur"><p>Commande</p><h1>Récapitulatif avant paiement</h1><p>Cette page est une simulation pédagogique : aucun paiement ni donnée personnelle n’est réellement traité.</p></div></section>
    <section class="section"><div class="conteneur">
      <div class="etapes"><div class="etape">1. Coordonnées</div><div class="etape active">2. Récapitulatif</div><div class="etape">3. Paiement</div></div>
      <div class="formulaire-bloc">
        <h2>Votre commande</h2>
        <p><strong>Photographie :</strong> <span id="photo-recap"></span></p>
        <p><strong>Nom :</strong> <span id="nom-recap"></span></p>
        <p><strong>E-mail :</strong> <span id="email-recap"></span></p>
        <p><strong>Téléphone :</strong> <span id="telephone-recap"></span></p>
        <p><strong>Adresse :</strong> <span id="adresse-recap"></span></p>
        <p><strong>Commentaire :</strong> <span id="commentaire-recap"></span></p>
        <hr>
        <p class="prix">Total : 55 €</p>
        <p>La plateforme de paiement est fictive et aucune transaction ne peut être réalisée.</p>
        <a class="bouton" href="confirmation.html?commande=validee">Passer au paiement factice</a>
      </div>
    </div></section>
  </main>
  <footer class="site-footer"><div class="conteneur footer-bas">© 2026 Atelier Lumière — Projet pédagogique fictif.</div></footer>
  <script>
    const params = new URLSearchParams(window.location.search);
    document.getElementById("photo-recap").textContent = (params.get("photo") || "").replaceAll("-", " ");
    document.getElementById("nom-recap").textContent = params.get("nom") || "";
    document.getElementById("email-recap").textContent = params.get("email") || "";
    document.getElementById("telephone-recap").textContent = params.get("telephone") || "";
    document.getElementById("adresse-recap").textContent = params.get("adresse") || "";
    document.getElementById("commentaire-recap").textContent = params.get("commentaire") || "";
  </script>
  <script src="assets/js/app.js"></script>
  <script src="assets/js/gallery.js"></script>
  <script src="assets/js/carousel.js"></script>
  <script src="assets/js/upload-preview.js"></script>
  <script src="assets/js/fake-analytics.js"></script>
  <script src="assets/js/map.js"></script>
</body>
</html>
'@

$candidature = @'
<!DOCTYPE html>
<html lang="fr">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Candidater — Atelier Lumière</title>
  <link rel="stylesheet" href="assets/css/style.css">
  <link rel="stylesheet" href="assets/css/animations.css">
</head>
<body>
  <div class="bande-info">Atelier Lumière étudie les candidatures spontanées — <span data-statut-activite>activité en cours</span></div>
  <header class="site-header"><div class="header-inner"><a class="logo" href="index.html">Atelier <span>Lumière</span></a><nav class="nav-principale"><ul><li><a href="index.html">Portfolio</a></li><li><a href="boutique.html">Boutique</a></li><li><a href="candidature.html">Candidater</a></li><li><a href="contact.html">Contact</a></li></ul></nav></div></header>
  <main>
    <section class="page-entete"><div class="conteneur"><p>Candidature</p><h1>Rejoindre l’atelier.</h1><p>Stage, assistance de prise de vue, retouche, production ou collaboration artistique : envoyez votre candidature spontanée.</p></div></section>
    <section class="section"><div class="conteneur">
      <div class="grille-3">
        <article class="carte"><i class="fa-solid fa-file-arrow-up"></i><h3>Documents acceptés</h3><p>PDF, DOC, DOCX, ODT, TXT, JPG, PNG, ZIP et plusieurs pièces complémentaires.</p></article>
        <article class="carte"><i class="fa-solid fa-hard-drive"></i><h3>Fichiers volumineux</h3><p>Jusqu’à 25 Mo par document afin de transmettre vos portfolios et travaux complets.</p></article>
        <article class="carte"><i class="fa-solid fa-clock"></i><h3>Réponse</h3><p>Une vérification simulée est lancée après l’envoi avant affichage d’un numéro de dossier.</p></article>
      </div>

      <div class="formulaire-bloc" style="margin-top:42px">
        <h2>Déposer une candidature</h2>
        <p>Ce formulaire est fictif. Les fichiers restent dans votre navigateur et ne sont pas transmis à un serveur.</p>
        <form id="form-candidature">
          <div class="champ"><label for="nom">Nom et prénom</label><input id="nom" name="nom" type="text" required></div>
          <div class="champ"><label for="email">Adresse e-mail</label><input id="email" name="email" type="email" required></div>
          <div class="champ"><label for="poste">Type de candidature</label><select id="poste" name="poste"><option>Stage</option><option>Assistant·e photographe</option><option>Retouche photo</option><option>Collaboration artistique</option><option>Candidature spontanée</option></select></div>
          <div class="champ"><label for="presentation">Présentez votre démarche</label><textarea id="presentation" name="presentation" rows="8"></textarea></div>

          <div class="zone-upload">
            <i class="fa-solid fa-cloud-arrow-up"></i>
            <strong>Cliquez pour sélectionner vos documents ou glissez-les ici</strong>
            <p>CV, lettre de motivation, portfolio, références, fichiers de travail — 25 Mo par fichier.</p>
            <input id="documents" name="documents" type="file" multiple accept=".pdf,.doc,.docx,.odt,.txt,.jpg,.jpeg,.png,.zip" hidden>
          </div>
          <div class="liste-fichiers"></div>
          <button type="submit">Envoyer ma candidature</button>
        </form>
      </div>

      <div id="confirmation-candidature" class="message-confirmation" style="display:none; margin-top:25px">
        <h2>Candidature enregistrée</h2>
        <p>Votre message a bien été transmis à notre équipe. Numéro de suivi : <strong id="numero-dossier"></strong></p>
        <a class="bouton" href="index.html">Retour à l’accueil</a>
      </div>
    </div></section>
  </main>
  <footer class="site-footer"><div class="conteneur footer-bas">© 2026 Atelier Lumière — Projet pédagogique fictif.</div></footer>
  <script>
    document.getElementById("form-candidature").addEventListener("submit", function (event) {
      event.preventDefault();
      const bouton = event.target.querySelector("button[type='submit']");
      bouton.disabled = true;
      bouton.textContent = "Vérification de votre dossier…";

      let tentative = 0;
      const verification = setInterval(() => {
        tentative += 1;
        console.log("Vérification simulée de la candidature", tentative);

        if (tentative >= 3) {
          clearInterval(verification);
          document.getElementById("numero-dossier").textContent = "AL-" + Math.floor(100000 + Math.random() * 900000);
          document.getElementById("confirmation-candidature").style.display = "block";
          bouton.textContent = "Candidature envoyée";
          window.scrollTo({ top: document.body.scrollHeight, behavior: "smooth" });
        }
      }, 600);
    });
  </script>
  <script src="assets/js/app.js"></script>
  <script src="assets/js/gallery.js"></script>
  <script src="assets/js/carousel.js"></script>
  <script src="assets/js/upload-preview.js"></script>
  <script src="assets/js/fake-analytics.js"></script>
  <script src="assets/js/map.js"></script>
</body>
</html>
'@

$contact = @'
<!DOCTYPE html>
<html lang="fr">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Contact — Atelier Lumière</title>
  <link rel="stylesheet" href="assets/css/style.css">
  <link rel="stylesheet" href="assets/css/animations.css">
  <link rel="stylesheet" href="https://unpkg.com/leaflet@1.9.4/dist/leaflet.css">
</head>
<body>
  <header class="site-header"><div class="header-inner"><a class="logo" href="index.html">Atelier <span>Lumière</span></a><nav class="nav-principale"><ul><li><a href="index.html">Portfolio</a></li><li><a href="boutique.html">Boutique</a></li><li><a href="candidature.html">Candidater</a></li><li><a href="contact.html">Contact</a></li></ul></nav></div></header>
  <main>
    <section class="hero">
      <img class="hero-image" src="https://picsum.photos/id/1043/2400/1500" alt="Photographe travaillant dans une rue de ville">
      <div class="conteneur hero-contenu">
        <p>Contact</p>
        <h1>Parlons de votre projet.</h1>
        <p>Un reportage, un portrait, une commande de tirages, une exposition ou un projet éditorial : l’atelier est à votre écoute.</p>
      </div>
    </section>

    <section class="section">
      <div class="conteneur">
        <div class="grille-3">
          <article class="carte"><i class="fa-solid fa-location-dot"></i><h3>Atelier</h3><p>12 rue de la Lumière<br>35000 Rennes</p></article>
          <article class="carte"><i class="fa-solid fa-envelope"></i><h3>E-mail</h3><p>bonjour@atelier-lumiere.test<br>Réponse sous 48 heures ouvrées.</p></article>
          <article class="carte"><i class="fa-solid fa-phone"></i><h3>Téléphone</h3><p>02 99 00 00 00<br>Du lundi au vendredi, 9 h à 18 h.</p></article>
        </div>

        <div class="section-titre" style="margin-top:54px"><div><p>Localisation</p><h2>Venir à l’atelier</h2></div><p>La carte et ses tuiles sont chargées automatiquement, même si elle n’est pas consultée.</p></div>
        <div id="map"></div>

        <div class="section-titre" style="margin-top:54px"><div><p>Écrire à l’atelier</p><h2>Votre demande</h2></div></div>
        <div class="formulaire-bloc">
          <form action="confirmation.html" method="get">
            <div class="champ"><label for="nom">Nom</label><input id="nom" name="nom" required></div>
            <div class="champ"><label for="email">Adresse e-mail</label><input id="email" name="email" type="email" required></div>
            <div class="champ"><label for="sujet">Sujet</label><select id="sujet" name="sujet"><option>Demande de devis</option><option>Réservation de séance</option><option>Commande de tirage</option><option>Projet éditorial</option><option>Autre demande</option></select></div>
            <div class="champ"><label for="message">Votre message</label><textarea id="message" name="message" rows="9" required></textarea></div>
            <button type="submit">Envoyer mon message</button>
          </form>
        </div>
      </div>
    </section>

    <section class="section section-foncee">
      <div class="conteneur">
        <div class="section-titre"><div><p>Dernières réalisations</p><h2>Autres projets à découvrir</h2></div><p>Des images secondaires supplémentaires sont téléchargées sur cette page contact.</p></div>
        <div class="galerie">
          <img src="https://picsum.photos/id/1044/1800/1200" alt="Paysage de montagne">
          <img src="https://picsum.photos/id/1045/1800/1200" alt="Rue urbaine">
          <img src="https://picsum.photos/id/1046/1800/1200" alt="Forêt dense">
          <img src="https://picsum.photos/id/1047/1800/1200" alt="Bâtiment contemporain">
          <img src="https://picsum.photos/id/1048/1800/1200" alt="Mer agitée">
          <img src="https://picsum.photos/id/1049/1800/1200" alt="Paysage ensoleillé">
          <img src="https://picsum.photos/id/1050/1800/1200" alt="Montagne lointaine">
          <img src="https://picsum.photos/id/1051/1800/1200" alt="Vue de ville">
        </div>
      </div>
    </section>
  </main>
  <footer class="site-footer"><div class="conteneur footer-grille"><div><h3>Atelier Lumière</h3><p>Projet pédagogique fictif.</p></div><div><h3>Navigation</h3><ul><li><a href="index.html">Accueil</a></li><li><a href="boutique.html">Boutique</a></li></ul></div><div><h3>Contact</h3><ul><li><a href="#">Mentions légales</a></li><li><a href="#">Confidentialité</a></li></ul></div><div><h3>Réseaux</h3><ul><li><a href="#">Instagram</a></li><li><a href="#">LinkedIn</a></li></ul></div></div><div class="conteneur footer-bas">© 2026 Atelier Lumière</div></footer>
  <script src="https://unpkg.com/leaflet@1.9.4/dist/leaflet.js"></script>
  <script src="assets/js/app.js"></script>
  <script src="assets/js/gallery.js"></script>
  <script src="assets/js/carousel.js"></script>
  <script src="assets/js/upload-preview.js"></script>
  <script src="assets/js/fake-analytics.js"></script>
  <script src="assets/js/map.js"></script>
</body>
</html>
'@

$confirmation = @'
<!DOCTYPE html>
<html lang="fr">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Confirmation — Atelier Lumière</title>
  <link rel="stylesheet" href="assets/css/style.css">
  <link rel="stylesheet" href="assets/css/animations.css">
</head>
<body>
  <header class="site-header"><div class="header-inner"><a class="logo" href="index.html">Atelier <span>Lumière</span></a><nav class="nav-principale"><ul><li><a href="index.html">Portfolio</a></li><li><a href="boutique.html">Boutique</a></li><li><a href="candidature.html">Candidater</a></li><li><a href="contact.html">Contact</a></li></ul></nav></div></header>
  <main>
    <section class="page-entete"><div class="conteneur"><p>Confirmation</p><h1>Votre message a bien été transmis.</h1><p>Cette confirmation est fictive : aucun message n’est envoyé et aucune commande n’est créée.</p></div></section>
    <section class="section"><div class="conteneur"><div class="message-confirmation"><h2>Merci pour votre demande</h2><p>L’équipe Atelier Lumière vous répondra dans les meilleurs délais. Vous pouvez continuer à découvrir le portfolio ou les tirages disponibles.</p><a class="bouton" href="index.html">Retour à l’accueil</a><a class="bouton secondaire" href="boutique.html">Voir la boutique</a></div></div></section>
  </main>
  <footer class="site-footer"><div class="conteneur footer-bas">© 2026 Atelier Lumière — Projet pédagogique fictif.</div></footer>
  <script src="assets/js/app.js"></script>
  <script src="assets/js/gallery.js"></script>
  <script src="assets/js/carousel.js"></script>
  <script src="assets/js/upload-preview.js"></script>
  <script src="assets/js/fake-analytics.js"></script>
  <script src="assets/js/map.js"></script>
</body>
</html>
'@

$notes = @'
# Baseline volontairement non optimisée

Cette version constitue le point de départ de l'étude d'écoconception d'Atelier Lumière.

## Défauts introduits volontairement

- Nombreuses images haute définition externes et chargées immédiatement.
- Images secondaires et recommandations présentes dès l’ouverture.
- Absence de lazy loading.
- Absence de dimensions explicites sur les images.
- Plusieurs familles et graisses de Google Fonts.
- Font Awesome chargé dans son intégralité.
- Feuilles CSS séparées, non minifiées et règles d’animation permanentes.
- Six scripts JavaScript chargés sur toutes les pages.
- Manipulation globale du DOM.
- Compteurs, titre dynamique, animations et faux indicateurs décoratifs.
- Carrousel automatique.
- Aperçu des fichiers par lecture complète en base64.
- Formats de fichiers très permissifs et poids de 25 Mo par document.
- Temporisation / polling simulé avant confirmation de candidature.
- Carte Leaflet et tuiles OpenStreetMap chargées immédiatement.
- Vidéo externe intégrée sur la page d’accueil.

## Périmètre

Les formulaires restent fictifs : aucune donnée ni fichier n’est transmis à un serveur.
'@

Set-Content -Path ".\assets\css\style.css" -Value $style -Encoding UTF8
Set-Content -Path ".\assets\css\animations.css" -Value $animations -Encoding UTF8

Set-Content -Path ".\assets\js\app.js" -Value $appJs -Encoding UTF8
Set-Content -Path ".\assets\js\gallery.js" -Value $galleryJs -Encoding UTF8
Set-Content -Path ".\assets\js\carousel.js" -Value $carouselJs -Encoding UTF8
Set-Content -Path ".\assets\js\upload-preview.js" -Value $uploadJs -Encoding UTF8
Set-Content -Path ".\assets\js\fake-analytics.js" -Value $analyticsJs -Encoding UTF8
Set-Content -Path ".\assets\js\map.js" -Value $mapJs -Encoding UTF8

Set-Content -Path ".\index.html" -Value $index -Encoding UTF8
Set-Content -Path ".\boutique.html" -Value $boutique -Encoding UTF8
Set-Content -Path ".\coordonnees.html" -Value $coordonnees -Encoding UTF8
Set-Content -Path ".\recapitulatif.html" -Value $recapitulatif -Encoding UTF8
Set-Content -Path ".\candidature.html" -Value $candidature -Encoding UTF8
Set-Content -Path ".\contact.html" -Value $contact -Encoding UTF8
Set-Content -Path ".\confirmation.html" -Value $confirmation -Encoding UTF8
Set-Content -Path ".\docs\notes\defauts-baseline.md" -Value $notes -Encoding UTF8

Write-Host ""
Write-Host "Baseline Atelier Lumière générée avec succès." -ForegroundColor Green
Write-Host "Fichiers HTML, CSS, JS et documentation créés." -ForegroundColor Green
Write-Host ""
Write-Host "Pages à vérifier :" -ForegroundColor Cyan
Write-Host "  - index.html"
Write-Host "  - boutique.html"
Write-Host "  - candidature.html"
Write-Host "  - contact.html"
Write-Host "  - coordonnees.html"
Write-Host "  - recapitulatif.html"
Write-Host "  - confirmation.html"