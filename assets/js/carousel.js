/*
  Comportement baseline volontairement non optimal :
  le script reste chargé partout, même lorsque la page
  ne possède pas de carrousel.
  Son animation devient toutefois discrète.
*/

document.addEventListener("DOMContentLoaded", () => {
  const carrousel = document.querySelector("[data-carrousel]");

  if (!carrousel) {
    return;
  }

  const cartes = carrousel.querySelectorAll(".carte-actu");
  let index = 0;

  setInterval(() => {
    cartes.forEach((carte) => {
      carte.style.outline = "none";
    });

    if (cartes[index]) {
      cartes[index].style.outline = "2px solid rgba(200, 140, 69, 0.55)";
      cartes[index].style.outlineOffset = "3px";
    }

    index = (index + 1) % cartes.length;
  }, 6000);
});