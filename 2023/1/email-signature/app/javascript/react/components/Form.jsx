import * as React from "react"

const Form = ({ employeeInfo, setEmployeeInfo }) => {
  const handleEmployeeInfoChange = (event) => {
    const { id, value } = event.target // target == { id: "fullName", value: "Joe" }
    setEmployeeInfo({...employeeInfo, [id]: value })
  }

  return(
    <section className="card">
      <div className="card-body">
        <div className="row mb-3">
          <label htmlFor="fullName" className="col-sm-3 col-form-label">Full Name*</label>
          <div className="col-sm-9">
            <input type="text" className="form-control" id="fullName" value={ employeeInfo.fullName } onChange={ handleEmployeeInfoChange } />
          </div>
        </div>
        <div className="row mb-3">
          <label htmlFor="title" className="col-sm-3 col-form-label">Title</label>
          <div className="col-sm-9">
            <input type="text" className="form-control" id="title" value={ employeeInfo.title } onChange={ handleEmployeeInfoChange }/>
          </div>
        </div>
        <div className="row mb-3">
          <label htmlFor="company" className="col-sm-3 col-form-label">Company*</label>
          <div className="col-sm-9">
            <select className="form-select" id="company">
              <option value="1">One</option>
              <option value="2">Two</option>
            </select>
          </div>
        </div>
        <div className="row mb-3">
          <label htmlFor="email" className="col-sm-3 col-form-label">Email*</label>
          <div className="col-sm-9">
            <input type="text" className="form-control" id="email" value={ employeeInfo.email } onChange={ handleEmployeeInfoChange } />
          </div>
        </div>
        <div className="row mb-3">
          <label htmlFor="phone" className="col-sm-3 col-form-label">Phone</label>
          <div className="col-sm-9">
            <input type="text" className="form-control" id="phone" value={ employeeInfo.phone } onChange={ handleEmployeeInfoChange } />
          </div>
        </div>
      </div>
    </section>
  )
}

export default Form
