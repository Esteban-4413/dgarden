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
		"universidade/necc",
		"TaskNotes"
	],
    baseUrl: "esteban-4413.github.io/dgarden",
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
				light: "#eff1f5",
				lightgray: "#e6e9ef",
				gray: "#bcc0cc",
				darkgray: "#4c4f69",
				dark: "#5c5f77",
				secondary: "#1e66f5",
				tertiary: "#7287fd",
				highlight: "rgba(30, 102, 245, 0.15)",
				textHighlight: "#fff23688",
			},
			darkMode: {
				light: "#1e1e2e",        // Catppuccin Mocha Base
				lightgray: "#313244",    // Catppuccin Mocha Surface0
				gray: "#a6adc8",         // Catppuccin Mocha Subtext0
				darkgray: "#cdd6f4",     // Texto principal de alto contraste
				dark: "#bac2de",         // Títulos
				secondary: "#89b4fa",    // Links
				tertiary: "#b4befe",     // Acento secundario
				highlight: "rgba(137, 180, 250, 0.15)",
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
