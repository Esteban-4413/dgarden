import os

# --- CONFIGURACIÓN ---
CONTENT_DIR = "content"

def plantar_indices_quartz():
    """Genera un index.md minimalista en todas las subcarpetas para que Quartz lo autocomplete."""
    for raiz, carpetas, archivos in os.walk(CONTENT_DIR):
        # Omitir carpetas ocultas o de sistema de Obsidian y Quartz
        if any(x in raiz for x in [".obsidian", "public", ".git"]):
            continue

        # Evitamos tocar la raíz para no sobrescribir tu Home Page principal
        if raiz == CONTENT_DIR:
            continue

        # Extraemos el nombre de la carpeta para ponerlo como título
        nombre_carpeta = os.path.basename(raiz)
        index_path = os.path.join(raiz, "index.md")

        # Escribimos el formato minimalista
        with open(index_path, "w", encoding="utf-8") as f:
            f.write(f"---\ntitle: \"{nombre_carpeta}\"\n---\n\n")
            f.write("Here you'll find:\n")

    print(f"index.md en todo {CONTENT_DIR}.")

if __name__ == "__main__":
    plantar_indices_quartz()