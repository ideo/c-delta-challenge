import App, { StyledHeader } from '~/components/App'

let wrapper
beforeEach(() => {
  wrapper = shallow(<App />)
})

describe('App', () => {
  it('renders a row', () => {
    expect(wrapper.find('.row').exists()).toBeTruthy()
  })

  it('renders a StyledHeader with "Creative Qualities"', () => {
    expect(
      wrapper
        .find(StyledHeader)
        .render()
        .text()
    ).toEqual('Creative Qualities')
  })
})
