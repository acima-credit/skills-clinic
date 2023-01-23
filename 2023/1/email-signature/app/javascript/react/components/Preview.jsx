import * as React from "react"

const Preview = ({ employeeInfo }) => {
  return(
    <section className="card">
      <div className="card-body">
        <div><b>{ employeeInfo.fullName }</b></div>
        <div><i>{ employeeInfo.title }</i></div>
        <p>Company Info</p>
        <div>{ employeeInfo.email }</div>
        <div>{ employeeInfo.phone }</div>
      </div>
    </section>
  )
}

export default Preview
