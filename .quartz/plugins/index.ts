import { componentRegistry } from "../../quartz/components/registry"

export type { ObsidianFlavoredMarkdownOptions } from "./obsidian-flavored-markdown"

export const plugins: Record<string, Record<string, (...args: unknown[]) => void>> = {
  "obsidian-flavored-markdown": {
    ObsidianFlavoredMarkdown: (...args: unknown[]) => { componentRegistry.setOptionOverrides("obsidian-flavored-markdown", args[0] as Record<string, unknown>); },
  },
}

export const ObsidianFlavoredMarkdown = plugins["obsidian-flavored-markdown"].ObsidianFlavoredMarkdown
