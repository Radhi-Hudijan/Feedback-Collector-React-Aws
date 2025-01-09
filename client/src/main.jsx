import { StrictMode } from "react";
import { createRoot } from "react-dom/client";
import App from "./App.jsx";
import { Authenticator } from "@aws-amplify/ui-react";

// Import Amplify
import { Amplify } from "aws-amplify";
import awsExports from "./aws-exports.js";

// Initialize Amplify
Amplify.configure(awsExports);

createRoot(document.getElementById("root")).render(
  <StrictMode>
    <Authenticator.Provider>
      <App />
    </Authenticator.Provider>
  </StrictMode>
);
