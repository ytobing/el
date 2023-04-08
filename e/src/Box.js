import React, { Component } from 'react'
class Box extends Component {
  render() {
    const string = this.props.data.join('')
    return <div className="Box"> {string} </div>
  }
}
export default Box
