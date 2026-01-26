// Centralized frontend configuration values
// Export the API base URL so it can be changed in one place.
// Supports environment variables for demo and production builds.
const API_BASE = import.meta.env.VITE_API_BASE 
  ? String(import.meta.env.VITE_API_BASE).trim()
  : 'http://localhost:5000'

// Log the API base for debugging
if (typeof window !== 'undefined') {
  console.log('API_BASE configured as:', API_BASE)
}

export default {
  API_BASE
}
