import os
import urllib.parse

# --- CONFIGURACIÓN ---
CONTENT_DIR = "content"

def tiene_pdf(ruta):
    """Revisa si la carpeta actual o cualquier subcarpeta contiene al menos un PDF."""
    for raiz, _, archivos in os.walk(ruta):
        for archivo in archivos:
            if archivo.lower().endswith('.pdf'):
                return True
    return False

def organizar_archivos():
    """Genera index.md solo en carpetas que contienen archivos PDF."""
    for raiz, carpetas, archivos in os.walk(CONTENT_DIR):
        # Omitir carpetas ocultas o de sistema
        if any(x in raiz for x in [".obsidian", "public", ".git"]):
            continue

        # Evitamos tocar la raíz (el Home Page principal)
        if raiz == CONTENT_DIR:
            continue

        # --- NUEVA LÓGICA DE FILTRADO ---
        # Solo procedemos si esta carpeta o sus hijas tienen un PDF [cite: 2026-02-22]
        if not tiene_pdf(raiz):
            continue 

        nombre_carpeta = os.path.basename(raiz)
        index_path = os.path.join(raiz, "index.md")

        with open(index_path, "w", encoding="utf-8") as f:
            f.write(f"---\ntitle: \" {nombre_carpeta}\"\n---\n\n")
            f.write(f"# Contenido de {nombre_carpeta}\n\n")
            
            # Listar subcarpetas (solo si ellas también tienen PDFs) [cite: 2026-02-22]
            subcarpetas_con_pdf = [c for c in carpetas if tiene_pdf(os.path.join(raiz, c))]
            if subcarpetas_con_pdf:
                f.write("### Subcarpetas\n")
                for c in sorted(subcarpetas_con_pdf):
                    if not c.startswith('.'):
                        f.write(f"- [[{c}/index|{c}]]\n")
                f.write("\n")

            # Listar archivos
            f.write("### Archivos y Notas\n")
            for a in sorted(archivos):
                if a != "index.md" and not a.startswith('.'):
                    link_seguro = urllib.parse.quote(a)
                    f.write(f"- [{a}]({link_seguro})\n")

    print(f"Índices generados (solo para carpetas con PDFs) en {CONTENT_DIR}.")

if __name__ == "__main__":
    organizar_archivos()