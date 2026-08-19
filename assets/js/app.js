document.addEventListener('DOMContentLoaded', () => {
  console.log('Atelier Lumière — script chargé');

  const elements = document.querySelectorAll('*');
  elements.forEach(el => {
    el.dataset.loaded = 'true';
  });

  setInterval(() => {
    const now = new Date();
    document.title = `Atelier Lumière — ${now.toLocaleTimeString()}`;
  }, 1000);

  const images = document.querySelectorAll('img');
  images.forEach(img => {
    img.addEventListener('load', () => {
      console.log('Image chargée', img.src);
    });
  });

  const forms = document.querySelectorAll('form');
  forms.forEach(form => {
    form.addEventListener('submit', () => {
      console.log('Formulaire soumis');
    });
  });
});
