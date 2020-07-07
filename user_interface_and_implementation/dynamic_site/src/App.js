import React from 'react';
import Header from './components/Header';
import Sidebar from './components/Sidebar';
import Timetable from './components/Timetable';
import Nav from './components/Nav';
import 'bootstrap/dist/css/bootstrap.min.css';

import './App.css';


function App() {
  return (
    <div className="overflow-class">
      <Header /> 
      <div class="main">
        <div class="container-fluid">
          <div class="row"> 
            <Sidebar/>
            <div class="col-md-9 p-0 m-0">
              <Nav />
              <Timetable />
            </div>



          </div>
        </div>
      </div> 
    </div>  
  );
}

export default App;
