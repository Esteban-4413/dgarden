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


def aspirador_de_markdown():
    content_dir = "content"
    
    for root, dirs, files in os.walk(content_dir):
        for file in files:
            if file.endswith(".md"):
                file_path = os.path.join(root, file)
                
                with open(file_path, "r", encoding="utf-8") as f:
                    contenido = f.read()
                
                contenido_original = contenido
                
                # 1. ARREGLAR MI DESASTRE: Le devuelvo el corchete a las imágenes rotas
                contenido = contenido.replace('![(', '![](')
                
                # 2. Para futuras exportaciones: quitar "Exported image" CORRECTAMENTE
                contenido = re.sub(r'!\[Exported image\]', '![]', contenido, flags=re.IGNORECASE)
                
                # 3. Borrar la frase "Exported image" si quedó suelta
                contenido = re.sub(r'Exported image', '', contenido, flags=re.IGNORECASE)
                
                # 4. DESTRUCCIÓN DE ESPACIOS DE ONENOTE:
                # Primero, eliminamos todos los espacios en blanco que estén al final de una línea
                contenido = re.sub(r'[ \t]+\n', '\n', contenido)
                # Segundo, colapsamos los abismos de 3 o más saltos de línea en solo 2
                contenido = re.sub(r'\n{3,}', '\n\n', contenido)
                
                # Guardar solo si se limpió algo
                if contenido != contenido_original:
                    with open(file_path, "w", encoding="utf-8") as f:
                        f.write(contenido)
                    print(f"🧹 Desastre arreglado y basura aspirada en: {file}")


if __name__ == "__main__":
    print("🚀 Iniciando el mantenimiento maestro del jardín Lilás...")
    
    print("\n--- Fase 1: Limpiando Markdown y OneNote ---")
    aspirador_de_markdown()
    
    print("\n--- Fase 2: Desinfectando y Curando SVGs ---")
    desinfectar_jardin()
    
    print("\n✨ ¡Mantenimiento completado! Todo está reluciente. Ya puedes hacer el build.")