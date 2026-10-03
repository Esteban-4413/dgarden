import { QuartzConfig } from "./quartz/cfg"
import * as Plugin from "./quartz/plugins"

/**
 * Quartz 4 Configuration
 *
 * See https://quartz.jzhao.xyz/configuration for more information.
 */
const config: QuartzConfig = {
  configuration: {
    pageTitle: "My notes", 
    pageTitleSuffix: "",
    enableSPA: true,
    enablePopovers: true,
    analytics: {
      provider: "plausible",
    },
    locale: "en-US", 
	ignorePatterns: [
		"private",
		".git",
		".obsidian",
		"obsidian",
		"daily",
		"TaskNotes",
    "docs",
    "universidade/necc"
	],
    baseUrl: "esteban-4413.github.io/dgarden",
    defaultDateType: "modified",
    theme: {
      fontOrigin: "googleFonts",
      cdnCaching: true,
      typography: {
        header: "Lora", 
        body: "Lora",
        code: "JetBrains Mono",
      },
		colors: {
        lightMode: {
          light: "#eff1f5",        // Catppuccin Latte Base
          lightgray: "#ccd0da",    // Catppuccin Latte Surface0 (bordes)
          gray: "#6c6f85",         // Catppuccin Latte Subtext0 (metadatos)
          darkgray: "#4c4f69",     // Texto principal
          dark: "#8839ef",         // Catppuccin Latte Mauve (Títulos H1/H2)
          secondary: "#1e66f5",    // Catppuccin Latte Blue (Links)
          tertiary: "#179299",     // Catppuccin Latte Teal (Hover)
          highlight: "rgba(30, 102, 245, 0.15)",
          textHighlight: "#df8e1d88", // Catppuccin Latte Yellow (Resaltado)
        },
        darkMode: {
          light: "#1e1e2e",        // Catppuccin Mocha Base
          lightgray: "#313244",    // Catppuccin Mocha Surface0 (bordes)
          gray: "#a6adc8",         // Catppuccin Mocha Subtext0 (metadatos)
          darkgray: "#cdd6f4",     // Texto principal
          dark: "#cba6f7",         // Catppuccin Mocha Mauve (Títulos H1/H2)
          secondary: "#89b4fa",    // Catppuccin Mocha Blue (Links)
          tertiary: "#94e2d5",     // Catppuccin Mocha Teal (Hover)
          highlight: "rgba(137, 180, 250, 0.15)",
          textHighlight: "#f9e2af88", // Catppuccin Mocha Yellow (Resaltado limpio)
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
      Plugin.CustomOgImages(),
    ],
  },
}

export default config
