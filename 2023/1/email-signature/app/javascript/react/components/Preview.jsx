import * as React from "react"

const Preview = ({ employeeInfo }) => {
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

  return(
    <section className="card">
      <div className="card-body">
        <div><b>{ employeeInfo.fullName }</b></div>
        <div><i>{ employeeInfo.title }</i></div>
        { addressForCompany(employeeInfo.company) }
        <div>{ employeeInfo.email }</div>
        <div>{ employeeInfo.phone }</div>
      </div>
    </section>
  )
}

export default Preview
