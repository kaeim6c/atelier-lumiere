/* AperÃ§u de fichiers volontairement coÃ»teux : lecture base64 complÃ¨te. */
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
          apercu.alt = `AperÃ§u de ${fichier.name}`;
          item.prepend(apercu);
        }

        item.querySelector(".supprimer").addEventListener("click", () => item.remove());
      };

      lecteur.readAsDataURL(fichier);
      liste.appendChild(item);
    });
  });
});

