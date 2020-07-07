import React from 'react';
import { Button, Modal} from 'react-bootstrap'

function MyVerticallyCenteredModal(props) {
    return (
      <Modal
        {...props}
        size="lg"
        aria-labelledby="contained-modal-title-vcenter"
        centered
      >
        <Modal.Header closeButton>
          <Modal.Title id="contained-modal-title-vcenter">
            Trampoline Training
          </Modal.Title>
        </Modal.Header>
        <Modal.Body>
	        <i class="fas fa-map-marker-alt">&nbsp;&nbsp;DCU Sports Center</i>
	        <br/>
	        <i class="fas fa-clock">&nbsp;&nbsp;10:00 - 11:30</i>
        </Modal.Body>
        <Modal.Footer>
          <Button onClick={props.onHide}>Close</Button>
        </Modal.Footer>
      </Modal>
    );
  }
  
  function MyModal() {
    const [modalShow, setModalShow] = React.useState(false);
  
    return (
        
      <td className="coloured-cell">
        <div className="modalClicker" onClick={() => setModalShow(true)}>
            <h6>Trampoline Training</h6>
            <p>DCU Sports Center</p>
        </div>
        <MyVerticallyCenteredModal
          show={modalShow}
          onHide={() => setModalShow(false)}
        />  
      </td>
    );
  }
  
  

  export default MyModal;