/*
  Baseline pÃ©dagogique volontairement non optimisÃ©e.
  Ce script est chargÃ© sur toutes les pages, quelle que soit la fonctionnalitÃ©.
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
    document.title = `${titreOriginal} â€” ${maintenant}`;
  }, 1000);

  document.querySelectorAll("form").forEach((formulaire) => {
    formulaire.addEventListener("submit", () => {
      console.log("Formulaire soumis", new Date().toISOString());
    });
  });
});

