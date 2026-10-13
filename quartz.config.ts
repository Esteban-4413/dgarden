import { QuartzConfig } from "./quartz/cfg"
import * as Plugin from "./quartz/plugins"

/**
 * Quartz 4 Configuration
 *
 * See https://quartz.jzhao.xyz/configuration for more information.
 */
const config: QuartzConfig = {
  configuration: {
    pageTitle: "notes", 
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
    "universidade/necc",
    "vault/db/books/pdfs"
	],
    baseUrl: "esteban-4413.github.io/dgarden",
    defaultDateType: "modified",
    theme: {
      fontOrigin: "googleFonts",
      cdnCaching: true,
      typography: {
        header: "JetBrains Mono", 
        body: "JetBrains Mono",
        code: "JetBrains Mono",
      },
		colors: {
        lightMode: {
          light: "#eff1f5",        
          lightgray: "#ccd0da",   
          gray: "#6c6f85",       
          darkgray: "#4c4f69",   
          dark: "#7287fd",       
          secondary: "#1e66f5",  
          tertiary: "#179299",   
          highlight: "rgba(30, 102, 245, 0.15)",
          textHighlight: "#df8e1d88", 
        },
        darkMode: {
          light: "#1e1e2e",        
          lightgray: "#313244",    
          gray: "#a6adc8",         
          darkgray: "#cdd6f4",     
          dark: "#b4befe",         
          secondary: "#89b4fa",    
          tertiary: "#94e2d5",     
          highlight: "rgba(137, 180, 250, 0.15)",
          textHighlight: "#f9e2af88",
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
          light: "catppuccin-latte",
          dark: "catppuccin-mocha",
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
