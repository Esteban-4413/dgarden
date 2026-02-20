import os

def restaurar_todo(ruta_base):
    for raiz, carpetas, archivos in os.walk(ruta_base):
        # Saltamos la raíz de 'content'
        if raiz == ruta_base:
            continue

        nombre_carpeta = os.path.basename(raiz)
        titulo = nombre_carpeta.replace('-', ' ').replace('_', ' ').capitalize()
        
        # Buscamos materiales (PDF, SVG, etc.) por si los hay
        recursos = [f for f in archivos if f.lower().endswith(('.pdf', '.svg', '.excalidraw'))]
        
        ruta_index = os.path.join(raiz, 'index.md')
        
        with open(ruta_index, 'w', encoding='utf-8') as f:
            f.write(f'---\ntitle: "{titulo}"\n---\n\n')
            f.write(f'# {titulo}\n\n')
            f.write(f'Contenido de la carpeta **{titulo}**.\n\n')
            
            if recursos:
                f.write('## 📁 Archivos disponibles\n\n')
                for res in sorted(recursos):
                    icono = "📄" if res.lower().endswith('.pdf') else "🎨"
                    f.write(f'- {icono} [{res}]({res})\n')
            else:
                f.write('*(Esta carpeta es para organización o contiene notas de texto)*')
            
            f.write('\n\n---')
            
        print(f"✅ Restaurado: {nombre_carpeta}")

if __name__ == "__main__":
    if os.path.exists('content'):
        restaurar_todo('content')
        print("\n✨ ¡Listo! Todos los índices han sido restaurados.")
    else:
        print("❌ Error: No se encontró la carpeta 'content'.")