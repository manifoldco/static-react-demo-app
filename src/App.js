import React, { Component } from 'react';
import logo from './logo.svg';
import './App.css';

const STRIPE_KEY=process.env.REACT_APP_STRIPE_KEY;
const SEGMENT_KEY=process.env.REACT_APP_SEGMENT_KEY;

class App extends Component {
  render() {
    return (
      <div className="App">
        <header className="App-header">
          <img src={logo} className="App-logo" alt="logo" />
          <h1 className="App-title">Welcome to React</h1>
        </header>
        <p>Stripe key: {STRIPE_KEY}</p>
        <p>Segment key: {SEGMENT_KEY}</p>
      </div>
    );
  }
}

export default App;
