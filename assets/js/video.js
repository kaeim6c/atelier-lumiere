document.addEventListener("DOMContentLoaded", () => {
  const videoFacade = document.querySelector(".video-facade");

  if (!videoFacade) {
    return;
  }

  const bouton = videoFacade.querySelector(".video-facade-bouton");
  const videoId = videoFacade.dataset.videoId;
  const videoTitle =
    videoFacade.dataset.videoTitle || "Vidéo de présentation Atelier Lumière";

  if (!bouton || !videoId) {
    return;
  }

  bouton.addEventListener(
    "click",
    () => {
      const iframe = document.createElement("iframe");

      iframe.src =
        `https://www.youtube.com/embed/${encodeURIComponent(videoId)}` +
        "?autoplay=1&rel=0&modestbranding=1";

      iframe.title = videoTitle;
      iframe.allow =
        "accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share";
      iframe.allowFullscreen = true;
      iframe.loading = "lazy";
      iframe.referrerPolicy = "strict-origin-when-cross-origin";

      videoFacade.replaceChildren(iframe);
      videoFacade.classList.add("video-chargee");
    },
    { once: true }
  );
});