describe("Check to see if Jest is testing properly", () => {
  it("tests truth", () => {
    expect(true).toBe(true)
  });

  it("tests lies", () => {
    expect(false).toBe(false)
  })

  it("uses jsdom", () => {
    const element = document.createElement('div')
    expect(element).not.toBeNull()
  })
})
