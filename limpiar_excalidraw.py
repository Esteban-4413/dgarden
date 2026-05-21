import os
import re

def desinfectar_jardin():
    content_dir = "content"
    
    for root, dirs, files in os.walk(content_dir):
        for file in files:
            file_path = os.path.join(root, file)
            
            # 1. Mantiene limpias las notas de Excalidraw
            if file.endswith(".excalidraw.md"):
                nombre_base = file.replace(".md", "")
                nuevo_md = f"---\ntitle: \"{nombre_base}\"\n---\n\n![[{nombre_base}.light.svg]]\n"
                with open(file_path, "w", encoding="utf-8") as f:
                    f.write(nuevo_md)

            # 2. Arregla los SVGs
            if file.endswith(".svg"):
                with open(file_path, "r", encoding="utf-8") as f:
                    svg_data = f.read()
                
                modificado = False
                
                # A) Limpieza original de fuentes Excalidraw
                if ".excalidraw." in file and "@font-face" in svg_data:
                    svg_data = re.sub(r"@font-face\s*{[^}]*}", "", svg_data)
                    modificado = True
                
                # B) EL ANTÍDOTO: Borra el parche pixelado que metimos antes
                if "quartz-dark-mode-patch" in svg_data:
                    # Busca el bloque de estilo que metimos y lo elimina
                    svg_data = re.sub(r'<style id="quartz-dark-mode-patch">.*?</style>', '', svg_data, flags=re.DOTALL)
                    print(f"🩹 Antídoto aplicado (adiós píxeles) en: {file}")
                    modificado = True
                
                if modificado:
                    with open(file_path, "w", encoding="utf-8") as f:
                        f.write(svg_data)

if __name__ == "__main__":
    print("Aplicando antídoto a los SVGs...")
    desinfectar_jardin()
    print("SVGs curados.")