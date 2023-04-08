import React,  { useState } from 'react'
import logo from './logo.svg';
import './App.css';
import ReactDOM from 'react-dom';
import axios from 'axios';





function App() {
    const [login,setLogin] = useState('')
    const [error, setError] = useState('')
    const [data,setData] = useState({
      username:"",
      password:""
    });

  const changeHandler = e => {
    setData({...data,[e.target.name]: e.target.value });
  }

  const submitHandler = e => {
    e.preventDefault();
    // console.log(data);
    axios.post('https://dummyjson.com/auth/login', data)
    .then(function (response) {
      // user list https://dummyjson.com/users
      setLogin('Login Success!')
      setError('')
      console.log(response)
    })
    .catch(function (error) {
      setLogin('Login Failed!')
      setError(error.message)
      console.log(error)
    });
  }                        
    return (
        <div>
        <center>
        <h2>Login</h2>
        <form onSubmit={submitHandler}>
          <label>username</label><br/>
        <input type="text" name="username" value={data.username} onChange={changeHandler}/><br/>
          <label>password</label><br/>
        <input type="password" name="password" value={data.password} onChange={changeHandler}/><br/><br/>
        <input type="submit" name="submit"/>
        <br/><br/>
          <label>{login}</label><br/>
          <label>{error}</label>
        </form>
        </center>
      </div>
    );
  }


export default App;

