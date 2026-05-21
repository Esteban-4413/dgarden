import os
import re

def limpiar_y_adaptar_archivos():
    content_dir = "content"
    
    # Bloque CSS avanzado inyectable para que el SVG se adapte al modo oscuro de Quartz
    estilo_modo_oscuro = """
    <style id="quartz-dark-mode-patch">
        @media (prefers-color-scheme: dark) {
            svg, g, path, text, line, polyline, polygon, circle { 
                stroke: #e4e4e4 !important; 
                fill: #e4e4e4 !important; 
            }
        }
        :root[data-theme="dark"] svg,
        :root[data-theme="dark"] g,
        :root[data-theme="dark"] path, 
        :root[data-theme="dark"] text, 
        :root[data-theme="dark"] line {
            stroke: #e4e4e4 !important;
            fill: #e4e4e4 !important;
        }
    </style>
    """
    
    for root, dirs, files in os.walk(content_dir):
        for file in files:
            file_path = os.path.join(root, file)
            
            # 1. Limpiar la nota .md de Excalidraw (Para evitar código sucio)
            if file.endswith(".excalidraw.md"):
                nombre_base = file.replace(".md", "")
                nuevo_md = f"---\ntitle: \"{nombre_base}\"\n---\n\n![[{nombre_base}.light.svg]]\n"
                with open(file_path, "w", encoding="utf-8") as f:
                    f.write(nuevo_md)
                print(f"📝 Nota Excalidraw limpia: {file}")

            # 2. Procesar todos los archivos SVG (Tanto Excalidraw como OneNote)
            if file.endswith(".svg"):
                with open(file_path, "r", encoding="utf-8") as f:
                    svg_data = f.read()
                
                modificado = False
                
                # A) Si es de Excalidraw, quitar la fuente gigante que da error XML
                if ".excalidraw." in file and "@font-face" in svg_data:
                    svg_data = re.sub(r"@font-face\s*{[^}]*}", "", svg_data)
                    print(f"🧹 SVG de Excalidraw desinfectado: {file}")
                    modificado = True
                
                # B) Inyectar el parche definitivo para el Modo Oscuro de Quartz
                if "quartz-dark-mode-patch" not in svg_data:
                    # Inyectamos el estilo justo después de abrir la etiqueta <svg>
                    svg_data = re.sub(r'(<svg[^>]*>)', r'\1' + estilo_modo_oscuro, svg_data)
                    print(f"💜 Parche de modo oscuro inyectado en: {file}")
                    modificado = True
                
                # Guardamos los cambios si el archivo sufrió alguna modificación
                if modificado:
                    with open(file_path, "w", encoding="utf-8") as f:
                        f.write(svg_data)

if __name__ == "__main__":
    print("Iniciando mantenimiento del jardín Lilás...")
    limpiar_y_adaptar_archivos()
    print("¡Todo listo! Ahora puedes ejecutar 'npx quartz build'")