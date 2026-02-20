import os

def crear_indices_con_materiales(ruta_base):
    for raiz, carpetas, archivos in os.walk(ruta_base):
        # Saltamos la carpeta raíz de content
        if raiz == ruta_base:
            continue

        nombre_carpeta = os.path.basename(raiz)
        titulo = nombre_carpeta.replace('-', ' ').replace('_', ' ').capitalize()
        
        # Buscamos todos los archivos PDF en esta carpeta específica
        pdfs = [f for f in archivos if f.lower().endswith('.pdf')]
        
        ruta_index = os.path.join(raiz, 'index.md')
        
        with open(ruta_index, 'w', encoding='utf-8') as f:
            # Metadatos para Quartz
            f.write(f'---\ntitle: "{titulo}"\n---\n\n')
            f.write(f'# {titulo}\n\n')
            f.write(f'Bienvenido a la sección de **{titulo}**. Aquí tienes el material disponible:\n\n')
            
            if pdfs:
                f.write('## 📚 Documentos y Recursos\n\n')
                for pdf in sorted(pdfs):
                    # Creamos un enlace de descarga para cada PDF encontrado
                    f.write(f'- 📄 [Descargar {pdf}]({pdf})\n')
                
                f.write('\n\n> [!TIP]\n> Si quieres ver un archivo sin descargarlo, puedes hacer clic en el enlace.')
            else:
                f.write('*(Aún no hay archivos PDF cargados en esta carpeta)*')
            
        print(f"✅ Procesado: {nombre_carpeta} ({len(pdfs)} PDFs listados)")

if __name__ == "__main__":
    # Verifica que estás ejecutando esto desde la carpeta raíz del proyecto
    if os.path.exists('content'):
        crear_indices_con_materiales('content')
    else:
        print("❌ Error: No se encontró la carpeta 'content'. Asegúrate de estar en la raíz de tu proyecto Quartz.")