// Centralized frontend configuration values.
// Priority:
// 1) VITE_API_URL (Vercel env)
// 2) Railway production URL when building for production
// 3) local backend for development
const DEFAULT_PROD_API = 'https://the-backdoor-mission-project-production.up.railway.app'
const rawApiUrl = (import.meta.env.VITE_API_URL || '').trim()
const fallbackApiUrl = import.meta.env.PROD ? DEFAULT_PROD_API : 'http://localhost:5000'
const chosenApiUrl = rawApiUrl || fallbackApiUrl

const normalizedApiUrl = chosenApiUrl.startsWith('http://') || chosenApiUrl.startsWith('https://')
  ? chosenApiUrl
  : `https://${chosenApiUrl}`

const API_BASE = normalizedApiUrl.replace(/\/+$/, '')

export default {
  API_BASE
}
