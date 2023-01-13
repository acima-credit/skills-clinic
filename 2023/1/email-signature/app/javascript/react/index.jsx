import * as React from "react"
import { createRoot } from "react-dom/client"
import Greeting from "./components/Greeting.jsx"

const root = document.getElementById("root")
if(root) {
  createRoot(root).render(<Greeting name="Acima" />)
}
