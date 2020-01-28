import React from 'react';
import Login from './components/authentication/Login';
import { BrowserRouter as Router, Route, Link } from "react-router-dom";
import ButtonAppBar from './components/Navbar'
import Info from './Pages/Info/'
import Acquire from './Pages/Acquire/'
import Explorer from './Pages/Explorer/'
import AppContext from  './AppData'
import ManageUsers from './Pages/ManageUsers'
import GroupLogin from './components/authentication/GroupSignIn'
import CSS from './App.css'
import {StateProvider} from './Store'

const App = () => {

  
  return (
    <StateProvider>
        <Router>
            <div className="App">
          
              <Route exact path="/" component={Login} />
              <Route exact path="/group" component={GroupLogin} />
              <Route exact path="/info" component={Info}/>
              <Route exact path="/acquire" component={Acquire}/>
              <Route exact path="/explorer" component={Explorer}/>
              <Route exact path="/manageusers" component={ManageUsers}/>
            </div>

        </Router>
    </StateProvider>
  );
}



export default App;
