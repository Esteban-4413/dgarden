import os

def procesar_jardin():
    # Ruta a tu carpeta de contenido
    content_path = "content"
    
    for root, dirs, files in os.walk(content_path):
        for file in files:
            # Solo procesamos los archivos .md que son de Excalidraw
            if file.endswith(".excalidraw.md") or (file.endswith(".md") and "excalidraw" in file):
                file_path = os.path.join(root, file)
                
                with open(file_path, "r", encoding="utf-8") as f:
                    lineas = f.readlines()

                # Verificamos si es un archivo de Excalidraw real
                es_excalidraw = any("excalidraw-plugin" in linea for linea in lineas)
                
                if es_excalidraw:
                    # El nombre de la imagen que Obsidian exporta automáticamente
                    # (Asegúrate de tener activa la opción en Obsidian que comentamos antes)
                    nombre_base = file.replace(".md", "")
                    
                    # Creamos el nuevo contenido limpio
                    # Usamos la sintaxis estándar de Quartz ![[...]]
                    nuevo_contenido = f"""---
title: "{nombre_base.replace('.excalidraw', '')}"
tags: [excalidraw]
---

![[{nombre_base}.light.svg]]

---
%% 
Aquí abajo queda el código técnico oculto por si quieres editarlo en Obsidian 
%%
"""
                    # Escribimos el archivo limpio sobre el viejo
                    with open(file_path, "w", encoding="utf-8") as f:
                        f.write(nuevo_contenido)
                    print(f"✨ Dibujo optimizado para Quartz: {file}")

if __name__ == "__main__":
    procesar_jardin()