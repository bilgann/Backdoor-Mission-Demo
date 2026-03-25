// Centralized frontend configuration values.
// Uses VITE_API_URL in production builds and falls back to local backend for development.
const rawApiUrl = (import.meta.env.VITE_API_URL || '').trim()
const normalizedApiUrl = rawApiUrl
  ? (rawApiUrl.startsWith('http://') || rawApiUrl.startsWith('https://')
      ? rawApiUrl
      : `https://${rawApiUrl}`)
  : 'http://localhost:5000'

const API_BASE = normalizedApiUrl.replace(/\/+$/, '')

export default {
  API_BASE
}
