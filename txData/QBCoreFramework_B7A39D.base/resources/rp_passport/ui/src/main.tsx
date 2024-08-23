import { StrictMode } from "react";
import { createRoot } from "react-dom/client";
import App from "./App.tsx";
import "./index.css";
import { VisibilityProvider } from "./providers/VisibilityProvider.tsx";

createRoot(document.getElementById("root")!).render(
  <StrictMode>
    <VisibilityProvider>
      <App />
    </VisibilityProvider>
  </StrictMode>
);
