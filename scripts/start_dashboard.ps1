# Quick Start Script for YOLOv11 Dashboard
# Windows PowerShell

Write-Host "============================================================" -ForegroundColor Cyan
Write-Host "🌊 YOLOv11 Drowning Detection Dashboard" -ForegroundColor Cyan
Write-Host "============================================================" -ForegroundColor Cyan
Write-Host ""

# Check if virtual environment exists
if (Test-Path ".venv\Scripts\Activate.ps1") {
    Write-Host "✅ Activating virtual environment..." -ForegroundColor Green
    & .venv\Scripts\Activate.ps1
} else {
    Write-Host "⚠️  No virtual environment found. Creating one..." -ForegroundColor Yellow
    python -m venv .venv
    & .venv\Scripts\Activate.ps1
    Write-Host "✅ Installing dependencies..." -ForegroundColor Green
    pip install --upgrade pip
    pip install -r requirements.txt
}

Write-Host ""
Write-Host "🚀 Starting dashboard..." -ForegroundColor Green
Write-Host ""

# Start the Flask app
python app.py
