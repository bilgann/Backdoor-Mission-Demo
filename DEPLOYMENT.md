# Deployment Guide

This guide covers deploying the Backdoor Mission Demo to production:
- **Frontend**: Vercel
- **Backend**: Render
- **Database**: Supabase (already configured)

---

## Backend Deployment (Render)

### 1. Prepare Backend for Render

Create `render.yaml` in the project root (already included if generated, otherwise create manually).

### 2. Create Web Service on Render

1. Go to https://render.com and sign in
2. Click **New** → **Web Service**
3. Connect your GitHub repo: `bilgann/Backdoor-Mission-Demo`
4. Configure:
   - **Name**: `backdoor-mission-backend` (or your choice)
   - **Region**: Choose closest to your users
   - **Branch**: `demo-readonly` (or `main` after merge)
   - **Root Directory**: `backend`
   - **Runtime**: `Python 3`
   - **Build Command**: `pip install -r requirements.txt`
   - **Start Command**: `gunicorn app:app`

### 3. Set Environment Variables on Render

In the Render dashboard for your service, go to **Environment** and add:

| Key | Value |
|-----|-------|
| `DATABASE_URL` | `postgresql://postgres:977ShtBViE%40j9_E@db.atgzpesdgsfjbcknzwnk.supabase.co:5432/postgres` |
| `DEMO_READ_ONLY` | `true` (or `false` if you want to allow writes) |
| `FLASK_ENV` | `production` |
| `PYTHON_VERSION` | `3.12.0` |

**Important**: URL-encode special characters in the password (@ becomes %40).

### 4. Add Gunicorn to Requirements

Render needs a production WSGI server. Add to `backend/requirements.txt`:
```
gunicorn==21.2.0
```

### 5. Deploy

Click **Create Web Service**. Render will:
- Clone your repo
- Install dependencies
- Start the Flask app

Once deployed, note your backend URL: `https://backdoor-mission-backend.onrender.com` (or similar).

---

## Frontend Deployment (Vercel)

### 1. Prepare Frontend for Vercel

Ensure `frontend/.env.production` points to your deployed backend.

### 2. Deploy to Vercel

#### Option A: Vercel CLI (Recommended)

1. Install Vercel CLI:
   ```bash
   npm install -g vercel
   ```

2. Navigate to frontend:
   ```bash
   cd frontend
   ```

3. Login to Vercel:
   ```bash
   vercel login
   ```

4. Deploy:
   ```bash
   vercel --prod
   ```

5. During setup:
   - **Set up and deploy**: `Y`
   - **Scope**: Your account
   - **Link to existing project**: `N`
   - **Project name**: `backdoor-mission-demo`
   - **Directory**: `./` (since you're already in frontend/)
   - **Override settings**: `N`

#### Option B: Vercel Dashboard

1. Go to https://vercel.com and sign in
2. Click **Add New** → **Project**
3. Import `bilgann/Backdoor-Mission-Demo`
4. Configure:
   - **Framework Preset**: `Vite`
   - **Root Directory**: `frontend`
   - **Build Command**: `npm run build`
   - **Output Directory**: `dist`
   - **Install Command**: `npm install`

### 3. Set Environment Variables on Vercel

In Vercel project settings → **Environment Variables**, add:

| Key | Value | Environment |
|-----|-------|-------------|
| `VITE_API_BASE` | `https://backdoor-mission-backend.onrender.com` | Production |
| `VITE_API_BASE` | `http://localhost:5000` | Development (optional) |

**Replace** `https://backdoor-mission-backend.onrender.com` with your actual Render backend URL.

### 4. Redeploy

After adding env vars, trigger a redeploy:
- Vercel Dashboard: **Deployments** → **...** → **Redeploy**
- CLI: `vercel --prod`

---

## Post-Deployment Configuration

### 1. Update CORS in Backend

Ensure your backend allows requests from your Vercel domain. In `backend/app.py`:

```python
CORS(app, resources={r"/*": {"origins": "*"}})  # Already set for demo
```

For production, you might want to restrict origins:
```python
CORS(app, resources={r"/*": {"origins": ["https://your-vercel-app.vercel.app"]}})
```

### 2. Test the Connection

1. Open your Vercel frontend URL: `https://backdoor-mission-demo.vercel.app`
2. Check browser console for API errors
3. Test a GET request (e.g., view clients list)
4. Verify read-only mode blocks writes (should return 403)

### 3. Initialize Demo Data (One-Time)

If you need to seed demo data in Supabase:

1. Temporarily disable read-only mode on Render:
   - Set `DEMO_READ_ONLY=false` in Render env vars
   - Redeploy

2. Use Postman or curl to create sample data:
   ```bash
   curl -X POST https://your-backend.onrender.com/client \
     -H "Content-Type: application/json" \
     -d '{"full_name": "John Demo", "gender": "M"}'
   ```

3. Re-enable read-only mode:
   - Set `DEMO_READ_ONLY=true` in Render env vars
   - Redeploy

---

## Troubleshooting

### Backend Issues

**Database Connection Fails**
- Verify `DATABASE_URL` is correctly URL-encoded
- Check Supabase database is running and accessible
- Test connection from Render shell: `python -c "import psycopg2; psycopg2.connect('your-db-url')"`

**500 Errors on Startup**
- Check Render logs: Dashboard → **Logs**
- Look for missing dependencies or import errors
- Ensure `gunicorn` is in `requirements.txt`

**CORS Errors**
- Verify CORS is enabled in `app.py`
- Check Vercel domain is allowed in CORS origins

### Frontend Issues

**API Not Connecting**
- Verify `VITE_API_BASE` in Vercel env vars
- Check browser console for CORS errors
- Test backend URL directly in browser

**Build Fails**
- Check Vercel build logs
- Ensure `package.json` has correct build script: `"build": "vite build"`
- Verify all dependencies are in `package.json`

**Environment Variables Not Working**
- Vite requires `VITE_` prefix for env vars
- Redeploy after adding/changing env vars
- Check `.env.production` is committed (optional)

---

## Monitoring & Logs

### Render Logs
Dashboard → Your Service → **Logs** tab

### Vercel Logs
Dashboard → Your Project → **Deployments** → Click deployment → **Logs**

### Database Monitoring
Supabase Dashboard → Your Project → **Database** → **Logs**

---

## Cost Optimization

- **Render Free Tier**: Spins down after 15 min inactivity (first request may be slow)
- **Vercel Free Tier**: 100GB bandwidth/month
- **Supabase Free Tier**: 500MB database, 2GB bandwidth

For production with better uptime, consider paid tiers.

---

## Security Notes

1. **Never commit `.env` files** with real credentials to public repos
2. Use environment variables on hosting platforms
3. Keep `DEMO_READ_ONLY=true` for public demos
4. Rotate database passwords periodically
5. Monitor Supabase usage for suspicious activity

---

## Quick Deploy Commands

```bash
# Backend (from project root)
# Already deployed via Render dashboard or render.yaml

# Frontend (from project root)
cd frontend
vercel --prod
```

Done! Your app should be live at:
- Frontend: `https://your-app.vercel.app`
- Backend: `https://your-backend.onrender.com`
