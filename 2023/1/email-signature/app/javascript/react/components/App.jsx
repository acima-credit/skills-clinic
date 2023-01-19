import * as React from "react"
import { useState } from "react";
import Form from "./Form.jsx"
import Preview from "./Preview.jsx"

const App = (props) => {
  const [employeeInfo, setEmployeeInfo] = useState({ fullName: ""})

  return(
    <div className="container">
      <p>Email Signature</p>
      <div className="row">
        <div className="col">
          <Form employeeInfo={ employeeInfo} setEmployeeInfo={ setEmployeeInfo } />
        </div>
        <div className="col">
          <Preview employeeInfo={ employeeInfo } />
        </div>
      </div>
    </div>
  )
}

export default App
