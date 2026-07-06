# build.ps1
#
# Builds Guide.md and Guide.pdf from the project Markdown files.
#
# Requirements:
#   - Pandoc
#   - A PDF engine (XeLaTeX recommended)
#
# Example:
#   ./build.ps1

$ErrorActionPreference = "Stop"

$ProjectRoot = Split-Path -Parent $MyInvocation.MyCommand.Path

$GuideFolder = Join-Path $ProjectRoot "Guide"

$OutputMarkdown = Join-Path $ProjectRoot "Guide.md"
$OutputPdf = Join-Path $ProjectRoot "Guide.pdf"

$Files = @(
    "01-Introduction.md",
    "02-Canta-and-Shizuku.md",
    "03-System-Settings.md",
    "04-01-Advanced-ADB-Toolkit.md",
    "04-02-Google-Play-Service-Hardening.md",
    "04-03-Display-and-User-Experience.md",
    "05-Game-Driver.md",
    "06-Appendices.md"
)

Write-Host ""
Write-Host "====================================="
Write-Host " PAM Optimization Guide Builder"
Write-Host "====================================="
Write-Host ""

# Remove previous output

Remove-Item $OutputMarkdown -ErrorAction Ignore
Remove-Item $OutputPdf -ErrorAction Ignore

# Build combined markdown

foreach ($File in $Files)
{
    $Path = Join-Path $GuideFolder $File

    if (!(Test-Path $Path))
    {
        Write-Host "Missing file: $File"
        exit 1
    }

    Write-Host "Adding $File"

    Add-Content $OutputMarkdown "`n`n"

    Get-Content $Path | Add-Content $OutputMarkdown

    Add-Content $OutputMarkdown "`n"
}

Write-Host ""
Write-Host "Guide.md created successfully."
Write-Host ""

# Fix assests reference in guide.md
(Get-Content $OutputMarkdown) `
    -replace '\.\./assets/', 'assets/' |
    Set-Content $OutputMarkdown

# Generate PDF

pandoc `
    $OutputMarkdown `
    --from markdown `
    --toc `
    --number-sections `
    --pdf-engine=xelatex `
    -V geometry:margin=1in `
    -V papersize=a4 `
    -V colorlinks=true `
    -o $OutputPdf

if ($LASTEXITCODE -ne 0)
{
    Write-Host ""
    Write-Host "PDF generation failed."
    exit $LASTEXITCODE
}

Write-Host ""
Write-Host "Guide.pdf created successfully."
Write-Host ""
