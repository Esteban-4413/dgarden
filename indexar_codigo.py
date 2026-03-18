import os

def generar_indices_codigo():
    content_dir = "content"
    # Extensiones que quieres que Quartz reconozca y suba
    ext_interes = {'.c', '.h', '.hs', '.py', '.java'}

    for root, dirs, files in os.walk(content_dir):
        # Filtramos los archivos de código en la carpeta actual
        archivos_codigo = [f for f in files if os.path.splitext(f)[1] in ext_interes]

        if archivos_codigo:
            # Creamos (o sobreescribimos) una nota de índice en esa carpeta
            index_path = os.path.join(root, "codigos_fuente.md")
            
            with open(index_path, "w", encoding="utf-8") as f:
                f.write("---\n")
                f.write(f"title: \"📂 Código Fuente: {os.path.basename(root)}\"\n")
                f.write("tags:\n  - code-index\n")
                f.write("---\n\n")
                f.write(f"> [!EXAMPLE] Archivos de código en esta carpeta\n")
                
                for code_file in archivos_codigo:
                    # El link debe ser relativo al archivo .md que estamos creando
                    f.write(f"> - 📄 [{code_file}]({code_file})\n")
            
            print(f"✅ Índice creado en: {root}")

if __name__ == "__main__":
    generar_indices_codigo()