import React from 'react';
import EditButton from './EditButton';
import LogIn from './LogIn';

class Nav extends React.Component {
	constructor(props) {
    super(props)
    this.state = { isEmptyState: true }
  }

  triggerAddTripState = () => {
    this.setState({
      ...this.state,
      isEmptyState: false,
      isAddTripState: true
    })
  }
  render() {
  
    return (
        <div class="subHeaderBar border-dark ">
              <div class="row">
                <div class="col-sm-6 text-center">
              <div class="dropdown">
                <button class="btn btn-primary dropdown-toggle mb-3" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                  week 12
                </button>
                <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                  <a class="dropdown-item" href="#">Week 1</a>
                  <a class="dropdown-item" href="#">Week 2</a>
                  <a class="dropdown-item" href="#">Week 3</a>
                  <a class="dropdown-item" href="#">Week 4</a>
                  <a class="dropdown-item" href="#">Week 5</a>
                  <a class="dropdown-item" href="#">Week 6</a>
                  <a class="dropdown-item" href="#">Week 7</a>
                  <a class="dropdown-item" href="#">Week 8</a>
                  <a class="dropdown-item" href="#">Week 9</a>
                  <a class="dropdown-item" href="#">Week 10</a>
                  <a class="dropdown-item" href="#">Week 11</a>
                  <a class="dropdown-item" href="#">Week 12</a>
                </div>
              </div>
            </div>
            <div class="col-sm-6 text-center">
            {this.state.isEmptyState && <EditButton addTrip={this.triggerAddTripState} />}

            {this.state.isAddTripState && <LogIn />}
            
            </div>

            </div>
          </div>
    );
  }
}

export default Nav;
