import React,  { useState } from 'react'
import logo from './logo.svg';
import './App.css';
import ReactDOM from 'react-dom';

function App() {
    const [data,setData] = useState({
      task:"",
      description:""
    });



  const changeHandler = e => {
    setData({...data,[e.target.name]: e.target.value });
  }

  const submitHandler = e => {
    
    localStorage.setItem('items', JSON.stringify([data]));
    window.location.reload()
    e.preventDefault();
  }                        
    return (
        <div>
        <center>
        <h2>Login</h2>
        <form onSubmit={submitHandler}>
          <label>task</label><br/>
        <input type="text" name="task" value={data.task} onChange={changeHandler}/><br/>
          <label>task description</label><br/>
        <textarea type="textbox" name="description" value={data.description} onChange={changeHandler}/><br/>
  
        <input type="submit" name="submit"/>
        <br/><br/>
          
        </form>
        </center>
        <ul>
              
          {localStorage.getItem("items") && JSON.parse(localStorage.getItem("items")).map(item => {
            return (
              <li>
                {item.task}
                <br></br>
                {item.description}
              </li>
            )
          })}
        </ul>
        
      </div>
    );
  }


export default App;


