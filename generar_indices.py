import os
import urllib.parse

# --- CONFIGURACIÓN ---
CONTENT_DIR = "content"

def organizar_archivos():
    """Recorre las carpetas y genera archivos index.md con enlaces seguros."""
    for raiz, carpetas, archivos in os.walk(CONTENT_DIR):
        # Omitir carpetas ocultas o de sistema
        if any(x in raiz for x in [".obsidian", "public", ".git"]):
            continue

        # Evitamos tocar la raíz (el Home Page principal)
        if raiz == CONTENT_DIR:
            continue

        # Solo creamos índice si hay archivos o subcarpetas
        if not archivos and not carpetas:
            continue

        nombre_carpeta = os.path.basename(raiz)
        index_path = os.path.join(raiz, "index.md")

        with open(index_path, "w", encoding="utf-8") as f:
            f.write(f"---\ntitle: \"📁 {nombre_carpeta}\"\n---\n\n")
            f.write(f"# Contenido de {nombre_carpeta}\n\n")
            
            # Listar subcarpetas si existen
            if carpetas:
                f.write("### 📂 Subcarpetas\n")
                for c in sorted(carpetas):
                    if not c.startswith('.'):
                        f.write(f"- [[{c}/index|{c}]]\n")
                f.write("\n")

            # Listar archivos (PDFs, notas, imágenes)
            f.write("### 📄 Archivos y Notas\n")
            for a in sorted(archivos):
                if a != "index.md" and not a.startswith('.'):
                    # Codificar el nombre para que el link funcione en Quartz
                    link_seguro = urllib.parse.quote(a)
                    f.write(f"- [{a}]({link_seguro})\n")

    print(f"✅ Índices de carpetas generados correctamente en {CONTENT_DIR}.")

if __name__ == "__main__":
    organizar_archivos()