/* Faux indicateurs dÃ©coratifs, sans collecte ni envoi de donnÃ©es. */
document.addEventListener("DOMContentLoaded", () => {
  const zoneStatut = document.querySelector("[data-statut-activite]");
  let tour = 0;

  setInterval(() => {
    tour += 1;

    if (zoneStatut) {
      zoneStatut.textContent = `Actualisation de l'activitÃ© ${tour}`;
    }

    document.querySelectorAll(".carte, .carte-produit, .carte-actu").forEach((carte) => {
      carte.dataset.dernierControle = Date.now();
    });

    console.log("ContrÃ´le analytique dÃ©coratif", tour);
  }, 2500);
});

