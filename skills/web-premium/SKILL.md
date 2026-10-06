---
name: web-premium
description: Flujo maestro para crear una página web o landing de lujo, "tope de gama", con todos los skills del kit encadenados (grill-me, scroll-craft, human-speak, visualizations, infographic-builder, HyperFrames, media-use, skill-builder). Usar cuando el usuario pida "haceme una página web", "una landing", "la web de mi marca", "una página de venta", "que se vea premium / de lujo / no de plantilla", o quiera mejorar una web existente.
---

# Web premium — el flujo completo

Esta es la "memoria" del kit: qué skills usar, en qué orden y con qué estándar, para que una web salga con nivel de agencia y no de plantilla. Cada paso llama a un skill instalado. Si falta alguno, avisale al usuario y pedile que corra el instalador del kit.

## 0. La marca primero
Leé `MARCA.md` (en esta misma carpeta). Si está vacío o con los valores de ejemplo, completalo con el usuario antes de diseñar nada: nombre, a qué se dedica, público, tono, colores, tipografías, fotos/videos propios, logo, links y la acción principal de la web (comprar, reservar, escribir por WhatsApp…). Todo lo que sigue respeta ese archivo.

## 1. Brief — `grill-me`
Antes de tocar código, entrevistá al usuario con `grill-me` sobre la web: objetivo, a quién le habla, qué tiene que sentir el visitante, qué lo hace distinto de la competencia, secciones obligatorias, referencias que le gustan y que no. Todo queda guardado en un archivo de brief. Si el usuario dice "decidí vos", armá el brief vos y mostráselo para que lo apruebe.

## 2. Diseño y construcción — `scroll-craft` (el corazón)
Es el skill que hace que la web se sienta una experiencia y no un documento. Seguilo completo, sin atajos:
- Correr el `doctor.mjs` del skill para chequear node, ffmpeg completo, playwright/Chrome y la API key.
- Planificar: recorrido del visitante, gramática de página, curva emocional con UN pico, partitura de scroll y una "jugada firma" propia de la marca.
- Hero dimensional: fondo, sujeto, primer plano y atmósfera en planos separados que se mueven distinto. Composición aparte para celular.
- Mundo fotográfico (fotos reales del usuario primero; si faltan, generadas con kie.ai). Nada de diorama de plastilina genérico.
- Variedad: mínimo cuatro familias de recursos visuales y nunca el mismo dos veces seguidas.
- HTML semántico sobre el motor y los tokens de diseño del skill.
- Verificar con capturas en escritorio, celular (390×844) y movimiento reducido. No se da por terminada sin esas capturas revisadas.

## 3. Textos — `human-speak`
Escribí todos los textos en la voz del usuario (la de `MARCA.md`) y pasalos por `human-speak` antes de publicar: títulos, botones, beneficios, preguntas frecuentes, testimonios, pie. Que no suene a IA.

## 4. Gráficos y piezas visuales
- `visualizations` → diagramas o explicaciones estilo dibujado a mano (PNG).
- `infographic-builder` → infografías con la marca (PNG, con logo encima).
- `media-use` → íconos, logos de marcas, música, efectos de sonido, imágenes y corrección de color de fotos/videos reales.
- `hyperframes` (+ sus sub-skills) → videos para la web: loop del hero, intro animada, títulos en movimiento, demos de producto. Exportar en mp4/webm liviano y con póster.

## 5. Control final
- Probar la web en el navegador: consola sin errores, todos los links y botones funcionando, la acción principal visible arriba de todo y al final.
- Celular primero: sin scroll horizontal, textos legibles, botones fáciles de tocar.
- Peso: imágenes en webp/avif, videos comprimidos, carga rápida.
- `prefers-reduced-motion` respetado.
- Mostrarle al usuario las capturas antes de decir "listo".

## 6. Repetir lo que funcionó — `skill-builder`
Si el usuario va a hacer más webs o secciones con el mismo estilo, ofrecé convertir el proceso en un skill propio con `skill-builder`.

## Claves de API (opcionales)
Solo hacen falta para GENERAR imágenes/videos con IA (si el usuario tiene sus propias fotos, no). Van en un archivo `.env` en la carpeta del proyecto web:
```
KIE_AI_API_KEY=su_clave_de_kie.ai
KIE_API_KEY=su_clave_de_kie.ai
```
(La misma clave dos veces: `scroll-craft` y `visualizations` leen la primera; `infographic-builder` lee la segunda.) Se consigue en kie.ai. Nunca subir el `.env` a GitHub ni pegarlo en un chat.
