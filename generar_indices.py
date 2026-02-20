import os
import urllib.parse  # Esto es para arreglar los espacios en los links

def restaurar_con_links_seguros(ruta_base):
    for raiz, carpetas, archivos in os.walk(ruta_base):
        if raiz == ruta_base:
            continue

        nombre_carpeta = os.path.basename(raiz)
        titulo = nombre_carpeta.replace('-', ' ').replace('_', ' ').capitalize()
        recursos = [f for f in archivos if f.lower().endswith(('.pdf', '.svg', '.excalidraw'))]
        
        ruta_index = os.path.join(raiz, 'index.md')
        
        with open(ruta_index, 'w', encoding='utf-8') as f:
            f.write(f'---\ntitle: "{titulo}"\n---\n\n')
            f.write(f'# {titulo}\n\n')
            f.write(f'Contenido disponible en la carpeta **{titulo}**:\n\n')
            
            if recursos:
                f.write('## 📁 Archivos y Documentos\n\n')
                for res in sorted(recursos):
                    # IMPORTANTE: Codificamos el nombre para que el link funcione
                    link_seguro = urllib.parse.quote(res)
                    icono = "📄" if res.lower().endswith('.pdf') else "🎨"
                    # El nombre se ve normal, pero el link interno lleva %20
                    f.write(f'- {icono} [{res}]({link_seguro})\n')
            else:
                f.write('*(Carpeta de organización o apuntes)*')
            
        print(f"✅ Arreglado: {nombre_carpeta}")

if __name__ == "__main__":
    if os.path.exists('content'):
        restaurar_con_links_seguros('content')
        print("\n✨ ¡Enlaces reparados! Ahora todos deberían ser clickeables.")