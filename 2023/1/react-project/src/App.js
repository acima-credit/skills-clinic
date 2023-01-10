import logo from './logo.svg';
import './App.css';
import './Greeting'
import Greeting from './Greeting';

function App() {
  return (
    <div className="App">
      <header className="App-header">
        <img src={logo} className="App-logo" alt="logo" />
        <p>
          Edit <code>src/App.js</code> and save to reload!
        </p>
        <Greeting who="Eddy" />
        <Greeting who="Melissa" />
        <Greeting who="Ramses" />
      </header>
    </div>
  );
}

export default App;
