// Centralized frontend configuration values
// Export the API base URL so it can be changed in one place.
// Supports environment variables for demo and production builds.
const API_BASE = import.meta.env.VITE_API_BASE || 'http://localhost:5000'

export default {
  API_BASE
}
