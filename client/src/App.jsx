import { BrowserRouter, Routes, Route } from "react-router-dom";
import "./App.css";
import "./Custom-amplify-styles.css";
import HomePage from "./pages/HomePage";
import CreateFeedback from "./pages/CreateFeedback";
import Sign from "./pages/Sign";
import PrivateRoute from "./components/PrivateRoute";

function App() {
  return (
    <BrowserRouter>
      <Routes>
        <Route path="/" element={<HomePage />} />

        {/* add the private route here */}
        <Route element={<PrivateRoute />}>
          <Route path="/create-feedback" element={<CreateFeedback />} />
        </Route>
        <Route path="/sign" element={<Sign />} />
      </Routes>
    </BrowserRouter>
  );
}

export default App;
