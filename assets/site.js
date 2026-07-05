const menuButton = document.querySelector(".menu-button");
const navLinks = document.querySelector(".nav-links");

if (menuButton && navLinks) {
  menuButton.addEventListener("click", () => {
    const isOpen = navLinks.classList.toggle("open");
    menuButton.setAttribute("aria-expanded", String(isOpen));
  });

  navLinks.addEventListener("click", () => {
    navLinks.classList.remove("open");
    menuButton.setAttribute("aria-expanded", "false");
  });
}

document.querySelectorAll("[data-year]").forEach((node) => {
  node.textContent = new Date().getFullYear();
});

document.querySelectorAll("[data-copy]").forEach((button) => {
  button.addEventListener("click", async () => {
    const label = button.dataset.copyLabel || "Contact detail";
    const value = button.dataset.copy;
    const status = document.querySelector(".copy-status");

    try {
      await navigator.clipboard.writeText(value);
      if (status) status.textContent = `${label} copied: ${value}`;
    } catch {
      window.prompt(`Copy ${label.toLowerCase()}:`, value);
    }
  });
});
