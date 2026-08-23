/* Script chargÃ© sur toutes les pages, mÃªme sans galerie. */
document.addEventListener("DOMContentLoaded", () => {
  const images = document.querySelectorAll(".galerie img, .carte-produit img, .carte-actu img");

  images.forEach((image) => {
    image.addEventListener("load", () => {
      image.dataset.imageChargee = "oui";
      console.log("Image chargÃ©e :", image.currentSrc || image.src);
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

