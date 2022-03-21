import React from "react";
import { Link } from "react-router-dom";
import UpdateUserFormContainer from "./update_user_form_container";

class UserAccount extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      toggled: false
    }
  }

  render() {
    const { currentUser, logout } = this.props;
    if (this.state.toggled === true) {
      return(
        <div>
          <span className="profile-photo"></span>
          <span>{currentUser.first_name} {currentUser.last_name}</span>
          <UpdateUserFormContainer />
          <button onClick={() => this.setState({ toggled: false })}
          >Cancel</button>
        </div>
      )
    } else {
      return (
        <div>
          <span className="profile-photo"></span>
          <span>{currentUser.first_name} {currentUser.last_name}</span>
          <button
            onClick={() => this.setState({ toggled: true })}
          >Edit Account</button>
        </div>
      )
    }
  }
}

export default UserAccount;