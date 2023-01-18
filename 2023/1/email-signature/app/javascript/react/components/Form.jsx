import * as React from "react"

const Form = (props) => {
  return(
    <section>
      Form
      <div className="row mb-3">
        <label htmlFor="full-name" className="col-sm-2 col-form-label">Full Name*</label>
        <div class="col-sm-10">
          <input type="text" className="form-control" id="full-name" />
        </div>
      </div>
      <div className="row mb-3">
        <label htmlFor="title" className="col-sm-2 col-form-label">Title</label>
        <div class="col-sm-10">
          <input type="text" className="form-control" id="title" />
        </div>
      </div>
      <div className="row mb-3">
        <label htmlFor="company" className="col-sm-2 col-form-label">Company*</label>
        <div class="col-sm-10">
          <select className="form-select" id="company">
            <option selected>Choose...</option>
            <option value="1">One</option>
            <option value="2">Two</option>
          </select>
        </div>
      </div>
      <div className="row mb-3">
        <label htmlFor="email" className="col-sm-2 col-form-label">Email*</label>
        <div class="col-sm-10">
          <input type="text" className="form-control" id="email" />
        </div>
      </div>
      <div className="row mb-3">
        <label htmlFor="phone" className="col-sm-2 col-form-label">Phone</label>
        <div class="col-sm-10">
          <input type="text" className="form-control" id="phone" />
        </div>
      </div>
    </section>
  )
}

export default Form
