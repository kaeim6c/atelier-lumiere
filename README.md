# Atelier Lumière — Projet d'écoconception web

Projet pédagogique dans le cadre de la certification "Appliquer une démarche d'éco-conception pour réduire l'empreinte environnementale d'un service numérique".

## Contexte

Site vitrine et mini-boutique d'un photographe indépendant fictif. Le service propose :

- Un portfolio de photographies.
- Un formulaire de candidature (CV + lettre de motivation).
- Une boutique permettant d'acheter des photographies.
- Un formulaire de contact avec carte de localisation.

## Objectifs

- Réaliser une ACV simplifiée (screening) du service.
- Définir des unités fonctionnelles représentatives.
- Mesurer l'impact environnemental de chaque UF (EcoIndex, poids, requêtes, DOM).
- Identifier les points chauds et définir un budget environnemental.
- Mettre en place une CI GitHub Actions pour suivre les indicateurs.
- Implémenter des optimisations et mesurer les gains.

## Stack technique

- HTML5, CSS3, JavaScript vanilla.
- Hébergement : VPS IONOS.
- CI : GitHub Actions + EcoIndex (ou outil équivalent).

## Structure du dépôt

```text
atelier-lumiere/
├── index.html
├── candidature.html
├── boutique.html
├── coordonnees.html
├── recapitulatif.html
├── contact.html
├── confirmation.html
├── assets/
│   ├── images/
│   ├── css/
│   │   └── style.css
│   └── js/
│       └── app.js
├── docs/
│   ├── captures/
│   ├── mesures/
│   └── notes/
├── .github/
│   └── workflows/
│       └── eco-audit.yml
├── README.md
└── LICENSE
```

## Unités fonctionnelles

- **UF1** : Découvrir le portfolio du photographe.
- **UF2** : Déposer une candidature avec CV et lettre.
- **UF3** : Acheter une photographie (UF principale).
- **UF4** : Contacter le photographe.

## Méthodologie

1. Version baseline volontairement dégradée.
2. Mesures de référence (EcoIndex, poids, requêtes, DOM).
3. ACV simplifiée de type screening.
4. Référentiel de bonnes pratiques (RGESN, GR491, RWEB).
5. Budget environnemental et priorisation.
6. Optimisations et nouvelle série de mesures.
7. Comparaison avant/après et analyse des gains.

## Installation locale

```bash
# Depuis la racine du dépôt
python -m http.server 8000
```

Puis ouvrir `http://localhost:8000` dans un navigateur.

## Mesures

Les mesures sont réalisées avec :

- EcoIndex (extension ou CLI).
- Lighthouse (DevTools).
- Éventuellement Yellow Lab Tools.

Les résultats sont consignés dans `docs/mesures/`.

## CI

La CI exécute un audit automatique à chaque push ou pull request et vérifie le respect du budget environnemental.

Voir `.github/workflows/eco-audit.yml`.

## Licence

MIT — voir `LICENSE`.
