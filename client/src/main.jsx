import { StrictMode } from "react";
import { createRoot } from "react-dom/client";
import App from "./App.jsx";

// Import Amplify
import { Amplify } from "aws-amplify";
import awsExports from "./aws-exports.js";

// Initialize Amplify
Amplify.configure(awsExports);

createRoot(document.getElementById("root")).render(
  <StrictMode>
    <App />
  </StrictMode>
);
