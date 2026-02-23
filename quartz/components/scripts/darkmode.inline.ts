// quartz/components/scripts/darkmode.inline.ts
import { getUserPreferredColorScheme, renderExcalidrawLinks } from "./util"

// 1. Inicialización del tema
const currentTheme = (localStorage.getItem("theme") as "light" | "dark") ?? getUserPreferredColorScheme()
document.documentElement.setAttribute("saved-theme", currentTheme)

// 2. Función para avisar a otros componentes que el tema cambió
const emitThemeChangeEvent = (theme: "light" | "dark") => {
  const event: CustomEventMap["themechange"] = new CustomEvent("themechange", {
    detail: { theme },
  })
  document.dispatchEvent(event)
  
  // 🔥 CRUCIAL: Aquí llamamos a la función de Excalidraw para que las imágenes cambien
  renderExcalidrawLinks(theme)
}

document.addEventListener("nav", () => {
  // 3. Lógica para el botón manual (click)
  const switchTheme = () => {
    const newTheme =
      document.documentElement.getAttribute("saved-theme") === "dark" ? "light" : "dark"
    document.documentElement.setAttribute("saved-theme", newTheme)
    localStorage.setItem("theme", newTheme)
    emitThemeChangeEvent(newTheme)
  }

  // 4. Lógica para cambios automáticos del sistema operativo
  const themeChange = (e: MediaQueryListEvent) => {
    const newTheme = e.matches ? "dark" : "light"
    document.documentElement.setAttribute("saved-theme", newTheme)
    localStorage.setItem("theme", newTheme)
    emitThemeChangeEvent(newTheme)
  }

  // 5. Asignar el evento a todos los botones de Darkmode de la página
  for (const darkmodeButton of document.getElementsByClassName("darkmode")) {
    darkmodeButton.addEventListener("click", switchTheme)
    window.addCleanup(() => darkmodeButton.removeEventListener("click", switchTheme))
  }

  // 6. Escuchar cambios de preferencia del sistema (Luz/Sombra)
  const colorSchemeMediaQuery = window.matchMedia("(prefers-color-scheme: dark)")
  colorSchemeMediaQuery.addEventListener("change", themeChange)
  window.addCleanup(() => colorSchemeMediaQuery.removeEventListener("change", themeChange))
})