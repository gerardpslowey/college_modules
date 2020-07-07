import React from 'react';

class LogIn extends React.Component {
	constructor(props) {
		super(props);
		
  }
  render() {
  
    return (
        
        <div className = "row">
            <div className= "col-sm ml-5">
            <div class="input-group">
                <span class="input-group-addon"><i class="fas fa-user pt-2 pr-2"></i></span>
                <input id="email" type="email" class="form-control log-in" name="email" value="" placeholder="Email Address"/>                                        
            </div>

            </div>
            <div className= "col-sm">
            <div class="input-group">
                <span class="input-group-addon"><i class="fas fa-lock pt-2 pr-2"></i></span>
                <input id="password" type="password" class="form-control log-in" name="password" value="" placeholder="Password"/>                                        
            </div>
            </div>
            <div className= "col-sm">
                <button type="submit" class="btn btn-primary m-0">Login</button>
            </div>
        </div>
        
  
    );
  }
}

export default LogIn;
