import React, { Component } from 'react'
import styled from 'styled-components'

export const StyledHeader = styled.h1`
  font-size: 32px;
  text-transform: uppercase;
  font-weight: bold;
  text-align: center;
`

class App extends Component {
  render() {
    return (
      <div className="row">
        <div className="col-md-12">
          <StyledHeader>Creative Qualities</StyledHeader>
        </div>
      </div>
    )
  }
}

export default App
