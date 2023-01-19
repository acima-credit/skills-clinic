import * as React from "react"

const Preview = (props) => {
  return(
    <section>
      <div>Preview</div>
      <div>
        <div><b>{ props.employeeInfo.fullName }</b></div>
        <div><i>{ props.title }</i><br /></div>
        <p>Company Info</p>
        <div>{ props.email }</div>
        <div>{ props.phone }</div>
      </div>
    </section>
  )
}

export default Preview
