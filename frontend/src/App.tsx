import { BrowserRouter as Router, Routes, Route } from 'react-router-dom'
import Layout from './components/Layout'
import Home from './pages/Home'
import Clients from './pages/Clients'
import Analytics from './pages/Analytics'
import CoatCheck from './pages/CoatCheck'
import Sanctuary from './pages/Sanctuary'
import Washroom from './pages/Washroom'
import Clinic from './pages/Clinic'
import SafeSleep from './pages/SafeSleep'
import Activity from './pages/Activity'
import GetClients from './pages/GetClients'

function App() {
  return (
    <Router>
      <Layout>
        <Routes>
          <Route path="/" element={<Home />} />
          <Route path="/clients" element={<Clients />} />
          <Route path="/analytics" element={<Analytics />} />
          <Route path="/coat-check" element={<CoatCheck />} />
          <Route path="/sanctuary" element={<Sanctuary />} />
          <Route path="/washroom" element={<Washroom />} />
          <Route path="/clinic" element={<Clinic />} />
          <Route path="/safe-sleep" element={<SafeSleep />} />
          <Route path="/activity" element={<Activity />} />
          <Route path="/get-clients" element={<GetClients />} />
        </Routes>
      </Layout>
    </Router>
  )
}

export default App