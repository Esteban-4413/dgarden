import os

def crear_indices_inteligentes(ruta_base):
    for raiz, carpetas, archivos in os.walk(ruta_base):
        if raiz == ruta_base:
            continue

        # Definimos qué extensiones queremos rastrear
        extensiones_validas = ('.pdf', '.svg', '.excalidraw')
        archivos_encontrados = [f for f in archivos if f.lower().endswith(extensiones_validas)]
        
        # EL FILTRO: Solo procedemos si la carpeta tiene archivos de interés
        if archivos_encontrados:
            nombre_carpeta = os.path.basename(raiz)
            titulo = nombre_carpeta.replace('-', ' ').replace('_', ' ').capitalize()
            ruta_index = os.path.join(raiz, 'index.md')
            
            with open(ruta_index, 'w', encoding='utf-8') as f:
                f.write(f'---\ntitle: "{titulo}"\n---\n\n')
                f.write(f'# {titulo}\n\n')
                f.write(f'Recursos disponibles en **{titulo}**:\n\n')
                
                f.write('## 📁 Materiales\n\n')
                for archivo in sorted(archivos_encontrados):
                    icono = "📄" if archivo.endswith('.pdf') else "🎨"
                    f.write(f'- {icono} [{archivo}]({archivo})\n')
                
                f.write('\n\n> [!INFO]\n> Esta lista se actualiza automáticamente.')
            
            print(f"✅ Índice creado/actualizado: {nombre_carpeta} ({len(archivos_encontrados)} archivos)")
        else:
            # Opcional: Si antes había un index.md y ahora la carpeta está vacía, podrías borrarlo
            # Pero por ahora, simplemente no creamos nada en carpetas vacías.
            pass

if __name__ == "__main__":
    if os.path.exists('content'):
        crear_indices_inteligentes('content')
    else:
        print("❌ Error: No se encontró la carpeta 'content'.")