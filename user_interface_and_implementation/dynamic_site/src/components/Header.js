import React from 'react';
import logo from '../images/DCU-Logo.png';

class Header extends React.Component {
	constructor(props) {
		super(props);
		
  }
  render() {
  
    return (
        
        <nav class="navbar navbar-expand-md navbar-dark bg-dark fixed-top">
            <img class="dcu-logo d-none d-lg-block" src={logo}/>  
            <div class="header-title">
                DCU Clubs and Socs Timetable
            </div>
            
        </nav>
        
  
    );
  }
}

export default Header;
