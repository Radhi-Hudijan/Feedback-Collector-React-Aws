import { BrowserRouter, Routes, Route } from "react-router-dom";
import "./App.css";
import HomePage from "./pages/HomePage";
import CreateFeedback from "./pages/CreateFeedback";
import Sign from "./pages/Sign";
function App() {
  return (
    <BrowserRouter>
      <Routes>
        <Route path="/" element={<HomePage />} />
        <Route path="/create-feedback" element={<CreateFeedback />} />
        <Route path="/sign" element={<Sign />} />
      </Routes>
    </BrowserRouter>
  );
}

export default App;
