#!/usr/bin/env bash
# Instalador del kit de diseno web premium (Mac / Linux).
# Uso: bash instalar.sh
set -euo pipefail
KIT="$(cd "$(dirname "$0")" && pwd)"
SKILLS="$HOME/.claude/skills"
mkdir -p "$SKILLS"

for p in git node npx; do
  command -v "$p" >/dev/null || { echo "Falta $p. En Mac: brew install git node python ffmpeg"; exit 1; }
done
command -v ffmpeg >/dev/null || echo "Aviso: falta FFmpeg (lo usan scroll-craft y HyperFrames): brew install ffmpeg"

copiar() { rm -rf "$SKILLS/$2"; cp -R "$1" "$SKILLS/$2"; echo "  + $2"; }

TMP="$(mktemp -d)"
trap 'rm -rf "$TMP"' EXIT

echo "== 1/4 Bajando los skills de Nate Herk desde GitHub =="
for r in scroll-craft human-speak a-bunch-of-skills AIS-OS; do
  git clone --depth 1 --quiet "https://github.com/nateherkai/$r.git" "$TMP/$r"
done

echo "== 2/4 Instalando skills de diseno, textos y graficos =="
copiar "$TMP/scroll-craft/plugins/nateherk-design/skills/scroll-craft" scroll-craft
copiar "$TMP/human-speak/skills/human-speak" human-speak
for s in visualizations infographic-builder skill-builder; do
  copiar "$TMP/a-bunch-of-skills/.claude/skills/$s" "$s"
done
copiar "$TMP/AIS-OS/.claude/skills/grill-me" grill-me

echo "== 3/4 Skills oficiales de HyperFrames (videos y motion para la web) =="
npx -y skills add heygen-com/hyperframes -g -a claude-code -s '*' -y --copy

echo "== 4/4 Skill web-premium (el flujo maestro) =="
MARCA="$SKILLS/web-premium/MARCA.md"
BAK=""
[ -f "$MARCA" ] && BAK="$(mktemp)" && cp "$MARCA" "$BAK"
cp -R "$KIT/skills/web-premium" "$SKILLS/"
[ -n "$BAK" ] && cp "$BAK" "$MARCA"   # no pisar tu marca
echo "  + web-premium"

echo
echo "LISTO. Cerra y volve a abrir Claude para que cargue los skills."
echo "Primer paso: decile a Claude 'completa mi MARCA.md del skill web-premium'."
