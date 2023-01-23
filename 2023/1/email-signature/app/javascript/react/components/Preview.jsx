import * as React from "react"

// const Preview = ({ employeeInfo }) => {
const Preview = (props) => {
  return(
    <section className="card">
      <div className="card-body">
        <div><b>{ props.employeeInfo.fullName }</b></div>
        <div><i>{ props.title }</i></div>
        <p>Company Info</p>
        <div>{ props.email }</div>
        <div>{ props.phone }</div>
      </div>
    </section>
  )
}

export default Preview
