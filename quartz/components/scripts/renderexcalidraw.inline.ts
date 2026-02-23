// quartz/components/scripts/renderexcalidraw.inline.ts [cite: 2026-02-21]
async function renderExcalidraw() {
    const theme = document.documentElement.getAttribute("saved-theme") || "light"
    // Buscamos todas las imágenes que sean SVGs de Excalidraw [cite: 2026-02-21]
    const images = document.querySelectorAll("img[src$='.svg']")
    
    images.forEach((img) => {
      const src = img.getAttribute("src")
      if (src && (src.includes("excalidraw") || src.includes("chapter3"))) {
        // Si tienes versiones .light.svg y .dark.svg, aquí las intercambia [cite: 2026-02-21]
        // Por ahora, nos aseguramos de que la ruta sea relativa y limpia [cite: 2026-02-22]
        if (theme === "dark" && src.includes(".light.")) {
          img.setAttribute("src", src.replace(".light.", ".dark."))
        } else if (theme === "light" && src.includes(".dark.")) {
          img.setAttribute("src", src.replace(".dark.", ".light."))
        }
      }
    })
  }
  
  // Se ejecuta al cargar la página y al cambiar el tema [cite: 2026-02-21]
  document.addEventListener("nav", renderExcalidraw)
  document.addEventListener("themechange", renderExcalidraw)