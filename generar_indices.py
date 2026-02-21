import os
import urllib.parse
import subprocess
import re

CONTENT_DIR = "content"
HOME_PAGE = os.path.join(CONTENT_DIR, "index.md")

def get_git_status():
    """Obtiene los cambios y genera enlaces Markdown clickables [cite: 2026-02-21]."""
    try:

        subprocess.run(["git", "config", "core.quotepath", "off"])
        

        cmd = "git log -n 5 --name-only --pretty=format:'' | grep 'content/' | head -n 5"
        output = subprocess.check_output(cmd, shell=True).decode('utf-8').strip()
        
        if not output: return "No se detectaron cambios recientes."
        
        cambios = output.split('\n')
        resumen = "> [!ABSTRACT] **Últimas Actualizaciones (Git Status)**\n"
        resumen += "> ```git\n# On branch v4 [cite: 2026-02-21]\n"
        
        for f in cambios:
            if not f: continue
            ruta_relativa = f.replace('content/', '').strip()
            nombre_archivo = os.path.basename(ruta_relativa)
            
            if ruta_relativa.endswith(".md"):
                slug = ruta_relativa.replace(".md", "")
                link = f"[[{slug}|{nombre_archivo.replace('.md', '')}]]"
            else:
                link = f"[{nombre_archivo}]({urllib.parse.quote(ruta_relativa)})"
            
            resumen += f"+ {link}\n"
        
        resumen += "> ```"
        return resumen
    except Exception as e:
        return f"> [!WARNING] Error al obtener Git Status: {e}"

def update_home_page(novedades):
    """Actualiza SOLO la sección marcada en el index.md [cite: 2026-02-21]."""
    if not os.path.exists(HOME_PAGE): 
        print(f" No se encontró {HOME_PAGE}")
        return

    with open(HOME_PAGE, "r", encoding="utf-8") as f:
        contenido_actual = f.read()

    start_m = ""
    end_m = ""
    
    # Expresión regular que busca desde el inicio al fin del marcador (incluyéndolos) [cite: 2026-02-21]
    patron = re.compile(f"{start_m}.*?{end_m}", re.DOTALL)
    nuevo_bloque = f"{start_m}\n{novedades}\n{end_m}"

    if start_m in contenido_actual and end_m in contenido_actual:
        # Reemplaza lo que hay entre los marcadores, manteniendo el resto del archivo igual [cite: 2026-02-21]
        nuevo_contenido = patron.sub(nuevo_bloque, contenido_actual)
        with open(HOME_PAGE, "w", encoding="utf-8") as f:
            f.write(nuevo_contenido)
        print(" Sección de novedades actualizada en el Home Page.")
    else:
        print(" No se encontraron los marcadores y en tu index.md")

def organizar_indices_carpetas():
    """Genera los índices automáticos para las subcarpetas."""
    for raiz, _, archivos in os.walk(CONTENT_DIR):
        if any(x in raiz for x in [".obsidian", "public", ".git"]): continue
        if os.path.basename(raiz) == CONTENT_DIR or not archivos: continue

        index_path = os.path.join(raiz, "index.md")
        with open(index_path, "w", encoding="utf-8") as f:
            f.write(f"---\ntitle: \" {os.path.basename(raiz)}\"\n---\n\n###  Archivos y Notas\n")
            for a in sorted(archivos):
                if a != "index.md" and not a.startswith('.'):
                    f.write(f"- [{a}]({urllib.parse.quote(a)})\n")

if __name__ == "__main__":
    organizar_indices_carpetas()
    resumen = get_git_status()
    update_home_page(resumen)