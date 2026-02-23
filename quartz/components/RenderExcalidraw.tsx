// @ts-ignore: Quartz usa un sistema de bundling propio para scripts inline
import script from "./scripts/renderexcalidraw.inline"
import { QuartzComponentConstructor } from "./types"

const RenderExcalidraw = () => {
  return null // No añade HTML, solo inyecta el script
}

RenderExcalidraw.afterDOMLoaded = script

export default (() => RenderExcalidraw) satisfies QuartzComponentConstructor