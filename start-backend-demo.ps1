# PowerShell script to start the backend in DEMO mode with Supabase database
# This script loads the demo environment variables and starts the Flask server

Write-Host "Starting Backend in DEMO mode with Supabase database..." -ForegroundColor Cyan

# Navigate to backend directory
Set-Location -Path "$PSScriptRoot\backend"

# Load demo environment variables
if (Test-Path ".env.demo") {
    Write-Host "Loading demo environment variables from .env.demo" -ForegroundColor Green
    Get-Content .env.demo | ForEach-Object {
        if ($_ -match '^([^=]+)=(.*)$') {
            $name = $matches[1].Trim()
            $value = $matches[2].Trim()
            [Environment]::SetEnvironmentVariable($name, $value, "Process")
            Write-Host "  Set $name" -ForegroundColor Gray
        }
    }
} else {
    Write-Host "Warning: .env.demo file not found!" -ForegroundColor Yellow
}

# Activate virtual environment if it exists (.venv at repo root preferred)
$rootVenv = Join-Path $PSScriptRoot ".venv\Scripts\Activate.ps1"
$backendVenv = ".venv\Scripts\Activate.ps1"
$legacyBackendVenv = "venv\Scripts\Activate.ps1"

if (Test-Path $rootVenv) {
    Write-Host "Activating root .venv virtual environment..." -ForegroundColor Green
    & $rootVenv
} elseif (Test-Path $backendVenv) {
    Write-Host "Activating backend .venv virtual environment..." -ForegroundColor Green
    & $backendVenv
} elseif (Test-Path $legacyBackendVenv) {
    Write-Host "Activating backend venv virtual environment..." -ForegroundColor Green
    & $legacyBackendVenv
} else {
    Write-Host "No virtual environment found. Using system Python." -ForegroundColor Yellow
}

# Verify required packages and install if missing
try {
    python -c "import flask_cors, flask_sqlalchemy" | Out-Null
} catch {
    Write-Host "Installing backend dependencies..." -ForegroundColor Green
    python -m pip install -r "$PSScriptRoot\backend\requirements.txt"
}

# Start Flask application
Write-Host "Starting Flask server..." -ForegroundColor Green
Write-Host "Backend will run on http://localhost:5000" -ForegroundColor Cyan
Write-Host "Press Ctrl+C to stop the server" -ForegroundColor Yellow
Write-Host ""

python -m flask run --host=0.0.0.0 --port=5000
