import os
import re

def limpiar_archivos():
    # Carpeta donde Quartz busca tus archivos
    content_dir = "content"
    
    for root, dirs, files in os.walk(content_dir):
        for file in files:
            file_path = os.path.join(root, file)
            
            # 1. Limpiar la nota .md (para que Quartz no muestre código feo)
            if file.endswith(".excalidraw.md"):
                nombre_base = file.replace(".md", "")
                nuevo_md = f"---\ntitle: \"{nombre_base}\"\n---\n\n![[{nombre_base}.light.svg]]\n"
                with open(file_path, "w", encoding="utf-8") as f:
                    f.write(nuevo_md)
                print(f"Nota limpiada: {file}")

            # 2. Desinfectar el SVG (para quitar la fuente que da error de XML)
            if file.endswith(".svg") and ".excalidraw." in file:
                with open(file_path, "r", encoding="utf-8") as f:
                    svg_data = f.read()
                
                # Buscamos el bloque @font-face y todo su contenido gigante
                # Esto elimina la línea que llega a la columna 911328
                svg_limpio = re.sub(r"@font-face\s*{[^}]*}", "", svg_data)
                
                with open(file_path, "w", encoding="utf-8") as f:
                    f.write(svg_limpio)
                print(f"🧹 SVG desinfectado: {file}")

if __name__ == "__main__":
    limpiar_archivos()