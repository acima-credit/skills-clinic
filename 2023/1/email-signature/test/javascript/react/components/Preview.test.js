import React from "react"
import { render, cleanup } from "@testing-library/react"
import "@testing-library/jest-dom"

import Preview from "Preview.jsx"

afterEach(() => { cleanup() })

describe("Preview", ()  => {
  const employeeInfo = {
    fullName: "David Brady"
  }

  it("renders", () => {
    render(<Preview employeeInfo={ employeeInfo } />)
  })

  it("renders the full name", () => {
    render(<Preview employeeInfo={ employeeInfo } />)

    expect(document.body).toContainHTML(`<div><b>David Brady</b></div`)
  })
})