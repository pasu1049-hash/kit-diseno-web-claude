# Instalador del kit de diseno web premium (Windows).
# Uso: abrir PowerShell en esta carpeta y correr:
#   powershell -ExecutionPolicy Bypass -File .\instalar.ps1
$ErrorActionPreference = "Stop"
$kit = $PSScriptRoot
$skills = Join-Path $env:USERPROFILE ".claude\skills"
New-Item -ItemType Directory -Force $skills | Out-Null

Write-Host "== Revisando programas necesarios =="
$faltan = @()
foreach ($p in @("git", "node", "npx")) {
    if (-not (Get-Command $p -ErrorAction SilentlyContinue)) { $faltan += $p }
}
if ($faltan.Count -gt 0) {
    Write-Host "Faltan: $($faltan -join ', ')" -ForegroundColor Yellow
    Write-Host "Instalalos con:" -ForegroundColor Yellow
    Write-Host "  winget install Git.Git OpenJS.NodeJS.LTS Python.Python.3.12 Gyan.FFmpeg"
    Write-Host "Despues cerra y abri PowerShell de nuevo y volve a correr este instalador."
    exit 1
}
if (-not (Get-Command ffmpeg -ErrorAction SilentlyContinue)) {
    Write-Host "Aviso: falta FFmpeg (lo usan scroll-craft y HyperFrames). Instalalo con: winget install Gyan.FFmpeg" -ForegroundColor Yellow
}

function Copiar-Skill($origen, $nombre) {
    $dest = Join-Path $skills $nombre
    if (Test-Path $dest) { Remove-Item -Recurse -Force $dest }
    Copy-Item -Recurse -Force $origen $dest
    Write-Host "  + $nombre"
}

$tmp = Join-Path $env:TEMP ("kit-web-" + [guid]::NewGuid().ToString("N").Substring(0, 8))
New-Item -ItemType Directory -Force $tmp | Out-Null
try {
    Write-Host "== 1/4 Bajando los skills de Nate Herk desde GitHub =="
    foreach ($r in @("scroll-craft", "human-speak", "a-bunch-of-skills", "AIS-OS")) {
        git clone --depth 1 --quiet "https://github.com/nateherkai/$r.git" (Join-Path $tmp $r)
    }

    Write-Host "== 2/4 Instalando skills de diseno, textos y graficos =="
    Copiar-Skill (Join-Path $tmp "scroll-craft\plugins\nateherk-design\skills\scroll-craft") "scroll-craft"
    Copiar-Skill (Join-Path $tmp "human-speak\skills\human-speak") "human-speak"
    foreach ($s in @("visualizations", "infographic-builder", "skill-builder")) {
        Copiar-Skill (Join-Path $tmp "a-bunch-of-skills\.claude\skills\$s") $s
    }
    Copiar-Skill (Join-Path $tmp "AIS-OS\.claude\skills\grill-me") "grill-me"

    # visualizations e infographic-builder traen sus scripts aparte en el repo:
    # se copian adentro del skill y se ajustan las rutas para que anden en cualquier proyecto.
    foreach ($s in @("visualizations", "infographic-builder")) {
        Copy-Item -Recurse -Force (Join-Path $tmp "a-bunch-of-skills\scripts\$s") (Join-Path $skills "$s\scripts")
    }
    $f = Join-Path $skills "visualizations\SKILL.md"
    [IO.File]::WriteAllText($f, [IO.File]::ReadAllText($f).Replace("node scripts/visualizations/", "node ~/.claude/skills/visualizations/scripts/"))
    $f = Join-Path $skills "infographic-builder\SKILL.md"
    [IO.File]::WriteAllText($f, [IO.File]::ReadAllText($f).Replace("python scripts/infographic-builder/", "python ~/.claude/skills/infographic-builder/scripts/"))
    $f = Join-Path $skills "visualizations\scripts\generate-visual.js"
    [IO.File]::WriteAllText($f, [IO.File]::ReadAllText($f).Replace('const envPath = path.resolve(__dirname, "../../.env");', 'const envPath = fs.existsSync(path.resolve(process.cwd(), ".env")) ? path.resolve(process.cwd(), ".env") : path.resolve(__dirname, "../../.env");'))
}
finally {
    Remove-Item -Recurse -Force $tmp -ErrorAction SilentlyContinue
}

Write-Host "== 3/4 Skills oficiales de HyperFrames (videos y motion para la web) =="
npx -y skills add heygen-com/hyperframes -g -a claude-code -s '*' -y --copy

Write-Host "== 4/4 Skill web-premium (el flujo maestro) =="
$dest = Join-Path $skills "web-premium"
$marca = Join-Path $dest "MARCA.md"
$marcaVieja = $null
if (Test-Path $marca) { $marcaVieja = Get-Content $marca -Raw -Encoding UTF8 }
Copy-Item -Recurse -Force (Join-Path $kit "skills\web-premium") $skills
if ($marcaVieja) { Set-Content $marca $marcaVieja -Encoding UTF8 -NoNewline }   # no pisar tu marca
Write-Host "  + web-premium"

Write-Host ""
Write-Host "LISTO." -ForegroundColor Green
Write-Host "Cerra y volve a abrir Claude (Claude Code / app de escritorio) para que cargue los skills."
Write-Host "Primer paso: decile a Claude 'completa mi MARCA.md del skill web-premium'."
