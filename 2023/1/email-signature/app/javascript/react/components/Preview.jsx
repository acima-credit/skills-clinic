import { useRef } from "react";
import { useState } from "react"
import * as React from "react";

const Preview = ({ employeeInfo }) => {
  const signatureRef = useRef(null)
  const [showError, setShowError] = useState(false)

  const addressForCompany = (company) => {
    switch(company) {
      case "Acima":
        return(
          <div>
            <div>Acima</div>
            <div>13907 Minuteman Dr 5th Floor</div>
            <div>Draper, UT 84020</div>
          </div>
        )
      case "RAC":
        return(
          <div>
            <div>Rent-A-Center</div>
            <div>5501 Headquarters Dr</div>
            <div>Plano, TX 75024</div>
          </div>
        )
      default:
        return <p>Address Not Found</p>
    }
  }

  const copy = (_event) => {
    if (employeeInfo.fullName != "" && employeeInfo.company != "" && employeeInfo.email != "") {
      navigator.clipboard.writeText(signatureRef.current.innerHTML)
      setShowError(false)
    } else {
      setShowError(true)
    }
  }

  return(
    <section className="card">
      <div className="card-body">
        <div ref={ signatureRef }>
          { employeeInfo.fullName && <div><b>{ employeeInfo.fullName }</b></div> }
          { employeeInfo.title && <div><i>{ employeeInfo.title }</i></div> }
          { addressForCompany(employeeInfo.company) }
          { employeeInfo.email && <div>📧 { employeeInfo.email }</div> }
          { employeeInfo.phone && <div>☎ { employeeInfo.phone }</div> }
        </div>
        <button onClick={ copy } className="btn btn-primary mt-3">Copy to clipboard</button>
        { showError && <div className="text-danger">Please fill out all required fields</div> }
      </div>
    </section>
  )
}

export default Preview
