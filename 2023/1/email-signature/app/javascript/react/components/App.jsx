import * as React from "react"
import { useState } from "react";
import Form from "./Form.jsx"
import Preview from "./Preview.jsx"

const App = (_props) => {
  const [employeeInfo, setEmployeeInfo] = useState({
    fullName: "",
    title: "",
    email: "",
    phone: ""
  })

  return(
    <div className="container">
      <h1 className="display-6 my-4">Email Signature Generator</h1>
      <div className="row">
        <div className="col">
          <Form employeeInfo={ employeeInfo } setEmployeeInfo={ setEmployeeInfo } />
        </div>
        <div className="col">
          <Preview employeeInfo={ employeeInfo } />
        </div>
      </div>
    </div>
  )
}

export default App
