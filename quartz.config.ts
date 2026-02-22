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
    useAbsoluteUrls: false,
    ignorePatterns: ["private", "templates", ".obsidian", "**/excalidraw.md", "**/*.excalidraw.md",],
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
          light: "#faf4ed",         // Rosé Pine Light bg
          lightgray: "#f2e9e1",     // Bordes y UI
          gray: "#9893a5",          // Texto secundario
          darkgray: "#575279",      // Texto principal
          dark: "#286983",          // Títulos
          secondary: "#1A7DA4",     
          tertiary: "#d7827e",      // Acento secundario (Rose)
          highlight: "rgba(26, 125, 164, 0.15)",
          textHighlight: "#fff23688",
        },
        darkMode: {
          light: "#303446",         // Catppuccin Frappé bg
          lightgray: "#414559",     // Bordes y UI
          gray: "#838ba7",          // Texto secundario
          darkgray: "#c6d0f5",      // Texto principal
          dark: "#eebebe",          // Títulos (Rosewater)
          secondary: "#11B7C5",     
          tertiary: "#81c8be",      // Acento secundario (Teal suave)
          highlight: "rgba(17, 183, 197, 0.15)",
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