# PowerShell script to start the frontend in DEMO mode
# This script loads the demo environment variables and starts the Vite dev server

Write-Host "Starting Frontend in DEMO mode..." -ForegroundColor Cyan

# Navigate to frontend directory
Set-Location -Path "$PSScriptRoot\frontend"

# Check if .env.demo exists and copy to .env.local for Vite
if (Test-Path ".env.demo") {
    Write-Host "Loading demo environment variables from .env.demo" -ForegroundColor Green
    Copy-Item -Path ".env.demo" -Destination ".env.local" -Force
    Write-Host "  Created .env.local from .env.demo" -ForegroundColor Gray
} else {
    Write-Host "Warning: .env.demo file not found!" -ForegroundColor Yellow
}

# Check if node_modules exists
if (-not (Test-Path "node_modules")) {
    Write-Host "Installing dependencies..." -ForegroundColor Green
    npm install
}

# Start Vite dev server
Write-Host "Starting Vite dev server..." -ForegroundColor Green
Write-Host "Frontend will run on http://localhost:5173" -ForegroundColor Cyan
Write-Host "Press Ctrl+C to stop the server" -ForegroundColor Yellow
Write-Host ""

npm run dev
