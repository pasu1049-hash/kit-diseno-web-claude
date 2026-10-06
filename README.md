# Kit de diseño web premium con Claude

Los skills que usa **Matías "Pasu" Pasutti / 1% Fitness** para que Claude arme páginas web y landings con nivel de agencia: scroll cinematográfico, hero con profundidad, textos que no suenan a IA, gráficos y videos propios.

## Qué trae

| Skill | Para qué sirve en una web | De dónde sale |
|---|---|---|
| **web-premium** | La "memoria" del kit. Le enseña a Claude el flujo completo y en qué orden usar cada skill (brief → diseño → textos → gráficos/video → control final). Incluye `MARCA.md` para cargar tu marca una sola vez. | Este repo |
| **scroll-craft** | El corazón. Landings premium guiadas por el scroll: recorrido del visitante, curva emocional, una jugada firma, hero con planos que se mueven distinto (profundidad real), versión celular aparte y verificación con capturas en escritorio, celular y movimiento reducido. | [nateherkai/scroll-craft](https://github.com/nateherkai/scroll-craft) (MIT) |
| **human-speak** | Pasa todos los textos de la web por un filtro para sacarles el tono "IA" sin perder tu voz. | [nateherkai/human-speak](https://github.com/nateherkai/human-speak) (MIT) |
| **grill-me** | Te entrevista antes de diseñar (objetivo, público, diferencial, referencias) y guarda todo en un brief. | [nateherkai/AIS-OS](https://github.com/nateherkai/AIS-OS) |
| **visualizations** | Diagramas y explicaciones estilo dibujado a mano, en PNG. | [nateherkai/a-bunch-of-skills](https://github.com/nateherkai/a-bunch-of-skills) |
| **infographic-builder** | Infografías con tu marca y tu logo, en PNG. | [nateherkai/a-bunch-of-skills](https://github.com/nateherkai/a-bunch-of-skills) |
| **skill-builder** | Para convertir tu propio proceso en un skill nuevo cuando lo repetís. | [nateherkai/a-bunch-of-skills](https://github.com/nateherkai/a-bunch-of-skills) |
| **HyperFrames** (todos los skills oficiales: `hyperframes`, `-core`, `-animation`, `-creative`, `-keyframes`, `-audio`, `-cli`, `-registry`, `-studio`, `media-use`, `motion-graphics`, `product-launch-video`…) | Videos para la web hechos con HTML: loop del hero, intros, títulos animados, demos. `media-use` consigue íconos, logos, música e imágenes. | Oficial de HeyGen, [heygen-com/hyperframes](https://github.com/heygen-com/hyperframes) (Apache 2.0) |

El instalador baja cada skill desde su repo oficial, así siempre tenés la última versión.

> Además, Claude Code ya trae de fábrica su guía de diseño para páginas (no hay que instalar nada para eso).

## Cómo instalarlo

### Opción fácil: que Claude lo instale
En Claude Code (app de escritorio, pestaña **Code**, o terminal), pegá:

> Instalá el kit de diseño web de este repo: **https://github.com/pasu1049-hash/kit-diseno-web-claude**. Cloná el repo y corré el instalador.

### Opción manual
1. Tener instalado: **Git, Node.js 22+ y FFmpeg** (Python solo si vas a usar infografías con logo).
   - Windows (PowerShell): `winget install Git.Git OpenJS.NodeJS.LTS Python.Python.3.12 Gyan.FFmpeg`
   - Mac: `brew install git node python ffmpeg`
2. Descomprimir el kit (o `git clone`).
3. Dentro de la carpeta:
   - Windows: `powershell -ExecutionPolicy Bypass -File .\instalar.ps1`
   - Mac: `bash instalar.sh`
4. Cerrar y volver a abrir Claude.

Todo se instala en `~/.claude/skills`, así que funciona en cualquier proyecto.

## Primer uso
1. Decile a Claude: **"Completá mi MARCA.md del skill web-premium"** (nombre, tono, colores, fotos, acción principal).
2. Después: **"Haceme la página web de mi marca, que se vea de lujo, nivel tope de gama."**
   Claude te entrevista, planifica, construye, escribe los textos en tu voz, genera los gráficos y te muestra capturas en compu y celular antes de darla por terminada.

## Notas
- **Fotos propias = mejor resultado.** Con buenas fotos y videos tuyos no hace falta ninguna clave de API.
- **Generar imágenes/videos con IA** (opcional) usa kie.ai, que se paga aparte (centavos por imagen). Creá un `.env` en la carpeta de tu web con:
  ```
  KIE_AI_API_KEY=tu_clave
  KIE_API_KEY=tu_clave
  ```
  Nunca subas el `.env` a GitHub ni lo pegues en un chat.
- La primera vez que scroll-craft verifique una web te va a pedir `npm i playwright-core` dentro del proyecto: es para sacar las capturas automáticas.
- Si ya tenés alguno de estos skills, el instalador lo reemplaza por la versión oficial más nueva (tu `MARCA.md` no se pisa).
