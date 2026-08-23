/* Ce script est chargÃ© globalement ; la carte est initialisÃ©e si #map existe. */
document.addEventListener("DOMContentLoaded", () => {
  const conteneur = document.querySelector("#map");

  if (!conteneur || typeof L === "undefined") return;

  const carte = L.map("map").setView([48.1173, -1.6778], 13);

  L.tileLayer("https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png", {
    attribution: "&copy; OpenStreetMap contributors"
  }).addTo(carte);

  L.marker([48.1173, -1.6778])
    .addTo(carte)
    .bindPopup("Atelier LumiÃ¨re â€” Rennes")
    .openPopup();
});

