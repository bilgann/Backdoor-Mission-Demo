# Demo Environment Setup Guide

This guide explains how to run the application in **DEMO mode** for portfolio purposes, using your Supabase PostgreSQL database.

## Overview

The demo environment is configured to:
- Use Supabase PostgreSQL database instead of local database
- Run separately from your organization's production environment
- Be suitable for portfolio demonstrations

## Database Connection

**Supabase Database:**
- Host: `db.atgzpesdgsfjbcknzwnk.supabase.co`
- Port: `5432`
- Database: `postgres`
- Connection configured in `backend/.env.demo`

## Quick Start

### Option 1: Using PowerShell Scripts (Recommended)

#### Start Backend (Demo Mode)
```powershell
.\start-backend-demo.ps1
```

#### Start Frontend (Demo Mode)
```powershell
.\start-frontend-demo.ps1
```

### Option 2: Manual Setup

#### Backend

1. Navigate to the backend directory:
   ```powershell
   cd backend
   ```

2. Activate virtual environment (if exists):
   ```powershell
   .\venv\Scripts\Activate.ps1
   ```

3. Load demo environment:
   ```powershell
   # On Windows PowerShell
   Get-Content .env.demo | ForEach-Object {
       if ($_ -match '^([^=]+)=(.*)$') {
           [Environment]::SetEnvironmentVariable($matches[1].Trim(), $matches[2].Trim(), "Process")
       }
   }
   ```

4. Start Flask server:
   ```powershell
   python -m flask run --host=0.0.0.0 --port=5000
   ```

#### Frontend

1. Navigate to the frontend directory:
   ```powershell
   cd frontend
   ```

2. Copy demo environment file:
   ```powershell
   Copy-Item .env.demo .env.local
   ```

3. Install dependencies (if needed):
   ```powershell
   npm install
   ```

4. Start Vite dev server:
   ```powershell
   npm run dev
   ```

## Environment Files

### Backend: `backend/.env.demo`
Contains the Supabase database connection string and Flask configuration for demo mode.

### Frontend: `frontend/.env.demo`
Contains the API base URL configuration (points to backend server).

## Important Notes

1. **Database Initialization**: On first run, you may need to initialize the database schema:
   ```powershell
   cd backend
   python
   >>> from app import app, db
   >>> with app.app_context():
   ...     db.create_all()
   >>> exit()
   ```

2. **CORS**: The backend is configured to accept requests from any origin (`*`). For production deployment, update CORS settings in `app.py`.

3. **Environment Separation**: 
   - Development environment uses `backend/.env`
   - Demo environment uses `backend/.env.demo`
   - They are completely separate and won't interfere with each other

4. **Security**: The `.env.demo` file contains database credentials. Keep it secure and do not commit to public repositories.

## Accessing the Application

- **Frontend**: http://localhost:5173
- **Backend API**: http://localhost:5000
- **Backend Health Check**: http://localhost:5000/health (if available)

## Stopping the Servers

Press `Ctrl+C` in each terminal window to stop the respective server.

## Troubleshooting

### Database Connection Issues
- Verify Supabase database is accessible
- Check firewall settings
- Confirm credentials are correct in `.env.demo`

### Port Already in Use
- Backend (5000): Another Flask app might be running
- Frontend (5173): Another Vite server might be running
- Solution: Stop other servers or change ports

### Missing Dependencies
- Backend: Run `pip install -r requirements.txt`
- Frontend: Run `npm install`

## Production Deployment

For deploying the demo to a hosting platform:

1. Update `frontend/.env.demo` with your deployed backend URL
2. Build frontend: `npm run build`
3. Deploy backend with `DATABASE_URL` environment variable set to Supabase connection
4. Deploy frontend build files to static hosting

## Support

For issues specific to this demo setup, check:
- Database connectivity to Supabase
- Environment variable loading
- CORS configuration in backend
