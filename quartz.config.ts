import { QuartzConfig } from "./quartz/cfg"
import * as Plugin from "./quartz/plugins"

/**
 * Quartz 4 Configuration
 *
 * See https://quartz.jzhao.xyz/configuration for more information.
 */
const config: QuartzConfig = {
  configuration: {
    pageTitle: "cool stuff, ig?", 
    pageTitleSuffix: "",
    enableSPA: true,
    enablePopovers: true,
    analytics: {
      provider: "plausible",
    },
    locale: "en-US", // Idioma preferido
    baseUrl: "esteban-4413.github.io/dgarden",
    ignorePatterns: ["private", "templates", ".obsidian",],
    defaultDateType: "modified",
    theme: {
      fontOrigin: "googleFonts",
      cdnCaching: true,
      typography: {
        header: "New York, Georgia, serif", // Tu fuente de Obsidian
        body: "Inter, sans-serif",
        code: "JetBrains Mono, monospace",
      },
      colors: {
        lightMode: {
          light: "#fbfaff",         // Fondo blanco con un toque de lavanda
          lightgray: "#f0e7ff",     // Bordes y UI (morado muy claro)
          gray: "#9a8bbd",          // Texto secundario y fechas
          darkgray: "#4a3b6b",      // Texto principal (morado oscuro para lectura)
          dark: "#2d1b4d",          // Títulos (morado profundo)
          secondary: "#7c3aed",     // Links y acentos principales (violeta vibrante)
          tertiary: "#a78bfa",      // Acento secundario (morado pastel)
          highlight: "rgba(124, 58, 237, 0.1)", // Color al pasar el ratón o resaltar
          textHighlight: "#fff23688",
        },
        darkMode: {
          light: "#1a1625",         // Fondo "Deep Space" morado
          lightgray: "#2d283e",     // Bordes y UI (gris morado)
          gray: "#8071a1",          // Texto secundario
          darkgray: "#dcd7e8",      // Texto principal (lavanda muy claro)
          dark: "#f3f0ff",          // Títulos (casi blanco con tinte morado)
          secondary: "#b794f4",     // Links (púrpura neón suave)
          tertiary: "#805ad5",      // Acento secundario (amatista)
          highlight: "rgba(183, 148, 244, 0.15)", // Resaltado de líneas
          textHighlight: "#b3aa0288",
        },
      },
    },
  },
  plugins: {
    transformers: [
      Plugin.FrontMatter(),
      Plugin.CreatedModifiedDate({
        priority: ["frontmatter", "git", "filesystem"],
      }),
      Plugin.SyntaxHighlighting({
        theme: {
          light: "github-light",
          dark: "github-dark",
        },
        keepBackground: false,
      }),
      Plugin.ObsidianFlavoredMarkdown({ enableInHtmlEmbed: false }),
      Plugin.GitHubFlavoredMarkdown(),
      Plugin.TableOfContents(),
      Plugin.CrawlLinks({ markdownLinkResolution: "shortest" }),
      Plugin.Description(),
      Plugin.Latex({ renderEngine: "katex" }),
    ],
    filters: [Plugin.RemoveDrafts()],
    emitters: [
      Plugin.AliasRedirects(),
      Plugin.ComponentResources(),
      Plugin.ContentPage(),
      Plugin.FolderPage(),
      Plugin.TagPage(),
      Plugin.ContentIndex({
        enableSiteMap: true,
        enableRSS: true,
      }),
      Plugin.Assets(),
      Plugin.Static(),
      Plugin.Favicon(),
      Plugin.NotFoundPage(),
      // Plugin.CustomOgImages(), // Desactivado para evitar errores de despliegue
    ],
  },
}

export default config