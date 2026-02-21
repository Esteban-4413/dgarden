import os
import urllib.parse
import subprocess

# --- CONFIGURACIÓN --- [cite: 2026-02-21]
CONTENT_DIR = "content"
HOME_PAGE = os.path.join(CONTENT_DIR, "index.md")

def get_git_status():
    """Obtiene los últimos 5 archivos modificados en Git para el resumen [cite: 2026-02-21]."""
    try:
        # Comando para obtener archivos cambiados en los últimos commits [cite: 2026-02-21]
        cmd = "git log -n 5 --name-only --pretty=format:'' | grep 'content/' | head -n 5"
        output = subprocess.check_output(cmd, shell=True).decode('utf-8').strip()
        if not output:
            return "No se detectaron cambios recientes."
        
        cambios = output.split('\n')
        resumen = "> [!ABSTRACT] **Últimas Actualizaciones (Git Status)**\n"
        resumen += "> ```git\n"
        resumen += f"# On branch v4 [cite: 2026-02-21]\n"
        
        for f in cambios:
            if f:
                # Limpiamos el nombre para que no sea tan largo [cite: 2026-02-21]
                path_corto = f.replace('content/', '').strip()
                resumen += f"+ {path_corto}\n"
        
        resumen += "> ```\n"
        return resumen
    except Exception as e:
        return f"> [!WARNING] Error al obtener Git Status: {e}"

def update_home_page(novedades):
    """Inserta el bloque de novedades en el index.md principal [cite: 2026-02-21]."""
    if not os.path.exists(HOME_PAGE):
        return

    with open(HOME_PAGE, "r", encoding="utf-8") as f:
        lineas = f.readlines()

    # Buscamos marcadores para no duplicar el bloque cada vez que corramos el script
    start_marker = "\n"
    end_marker = "\n"
    
    nuevo_contenido = []
    ignorar = False
    encontrado = False

    for linea in lineas:
        if linea == start_marker:
            nuevo_contenido.append(start_marker)
            nuevo_contenido.append(novedades + "\n")
            ignorar = True
            encontrado = True
        elif linea == end_marker:
            nuevo_contenido.append(end_marker)
            ignorar = False
        elif not ignorar:
            nuevo_contenido.append(linea)

    # Si no existían marcadores, lo añadimos después del primer párrafo
    if not encontrado:
        nuevo_contenido = lineas[:10] + [start_marker, novedades + "\n", end_marker] + lineas[10:]

    with open(HOME_PAGE, "w", encoding="utf-8") as f:
        f.writelines(nuevo_contenido)
    print("✨ Home Page actualizada con el último Git Status [cite: 2026-02-21].")

def organizar_archivos():
    """Genera los index.md para cada carpeta de tus apuntes [cite: 2026-02-02, 2026-02-21]."""
    for raiz, carpetas, archivos in os.walk(CONTENT_DIR):
        # Evitar carpetas ocultas o de sistema
        if ".obsidian" in raiz or "public" in raiz:
            continue

        # Nombre de la carpeta actual
        nombre_carpeta = os.path.basename(raiz)
        if nombre_carpeta == CONTENT_DIR or not archivos:
            continue

        # Creamos el index.md de la carpeta
        index_path = os.path.join(raiz, "index.md")
        with open(index_path, "w", encoding="utf-8") as f:
            f.write(f"---\ntitle: \"📁 {nombre_carpeta}\"\n---\n\n")
            f.write(f"# Contenido de {nombre_carpeta}\n\n")
            
            # Listar subcarpetas
            if carpetas:
                f.write("### 📂 Subcarpetas\n")
                for c in sorted(carpetas):
                    if not c.startswith('.'):
                        f.write(f"- [[{c}/index|{c}]]\n")
                f.write("\n")

            # Listar archivos (PDFs, imágenes, etc) [cite: 2026-02-21]
            f.write("### 📄 Archivos y Notas\n")
            for a in sorted(archivos):
                if a != "index.md" and not a.startswith('.'):
                    # Codificar el nombre para que el link funcione en la web [cite: 2026-02-20]
                    link_seguro = urllib.parse.quote(a)
                    f.write(f"- [{a}]({link_seguro})\n")

    print(f"✅ Índices generados para {CONTENT_DIR} [cite: 2026-02-21].")

if __name__ == "__main__":
    organizar_archivos()
    resumen_git = get_git_status()
    update_home_page(resumen_git)