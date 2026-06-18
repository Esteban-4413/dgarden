import os

# --- CONFIGURACIÓN ---
CONTENT_DIR = "content"


def plantar_indices_quartz():
    """Genera un index.md minimalista en todas las subcarpetas para que Quartz lo autocomplete."""

    # IMPORTANTE: followlinks=True es obligatorio para que atraviese el symlink
    for raiz, carpetas, archivos in os.walk(CONTENT_DIR, followlinks=True):
        # Ampliamos la lista para proteger tus carpetas personales de Obsidian
        carpetas_ignoradas = [
            ".obsidian",
            "obsidian",
            "public",
            ".git",
            "daily",
            "TaskNotes",
            "necc",  # Ignora todo lo relacionado con este material
        ]

        # Omitir carpetas ocultas, de sistema o personales
        if any(x in raiz for x in carpetas_ignoradas):
            continue

        # Evitamos tocar la raíz para no sobrescribir tu Home Page principal (index.md)
        if raiz == CONTENT_DIR:
            continue

        # Extraemos el nombre de la carpeta para ponerlo como título
        nombre_carpeta = os.path.basename(raiz)
        index_path = os.path.join(raiz, "index.md")

        # Solo creamos el índice si no existe uno ya (evita sobrescribir apuntes que hayas hecho a mano)
        if not os.path.exists(index_path):
            with open(index_path, "w", encoding="utf-8") as f:
                f.write(f'---\ntitle: "{nombre_carpeta}"\n---\n\n')
                f.write("Here you'll find:\n")

    print(f"index.md plantados en todo {CONTENT_DIR}.")


if __name__ == "__main__":
    plantar_indices_quartz()
