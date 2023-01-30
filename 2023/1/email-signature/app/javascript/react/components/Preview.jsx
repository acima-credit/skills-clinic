import { useRef } from "react";
import * as React from "react";

const Preview = ({ employeeInfo }) => {
  const signatureRef = useRef(null)

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

  // https://stackoverflow.com/questions/39501289/in-reactjs-how-to-copy-text-to-clipboard
  // Get the text field
  // var copyText = document.getElementById("myInput");

  // // Select the text field
  // copyText.select();
  // copyText.setSelectionRange(0, 99999); // For mobile devices

  //  // Copy the text inside the text field
  // navigator.clipboard.writeText(copyText.value);

  // // Alert the copied text
  // alert("Copied the text: " + copyText.value);
  const copy = (event) => {
    console.log(event)
    console.log(signatureRef)
  }

  return(
    <section className="card">
      <div className="card-body">
        <div ref={ signatureRef }>
          <div><b>{ employeeInfo.fullName }</b></div>
          <div><i>{ employeeInfo.title }</i></div>
          { addressForCompany(employeeInfo.company) }
          {
            employeeInfo.email &&
            <div>
              <i className="bi bi-envelope me-2"></i>
              { employeeInfo.email }
            </div>
          }
          {
            employeeInfo.phone &&
            <div>
              <i className="bi bi-phone me-2"></i>
              { employeeInfo.phone }
            </div>
          }
        </div>
        <button onClick={ copy } className="btn btn-primary mt-3">Copy to clipboard</button>
      </div>
    </section>
  )
}

export default Preview
