import React from "react";
import { Link } from "react-router-dom";

class UpdateUserForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = this.props.currentUser;
    this.state.password = "";

    this.handleSubmit = this.handleSubmit.bind(this);
    this.renderErrors = this.renderErrors.bind(this);
    this.update = this.update.bind(this);
  }

  // Add a listener (on mount) that clears errors when component unmounts
  componentDidMount() {
    this.unlisten = this.props.history.listen(() => {
      this.props.clearSessionErrors();
    });
  }

  // Clear errors when component unmounts
  componentWillUnmount() {
    this.unlisten();
  }

  // Form helper methods
  handleSubmit(e) {
    e.preventDefault();
    const user = Object.assign({}, this.state);
    this.props.changeUserInfo(user).then(() => this.props.unToggle());
  }

  update(field) {
    return (e) => this.setState({ [field]: e.currentTarget.value });
  }

  // Error rendering helper
  renderErrors() {
    const { errors } = this.props;
    if (!errors) {
      return null;
    }
    return (
      <ul className="auth-errors">
        {errors.map((error, idx) => {
          return <li key={idx}>{error}</li>;
        })}
      </ul>
    );
  }

  // If current user is demo user, do not render a form, otherwise render form
  render() {
    if (this.state.id === 1) {
      return (
        <div className="auth-errors">You cannot modify the demo user.</div>
      );
    } else {
      return (
        <div className="update-form">
          {this.renderErrors()}
          <form onSubmit={this.handleSubmit}>
            <p>Email</p>
            <input
              type="text"
              onChange={this.update("email")}
              value={this.state.email}
            />

            <p>Password</p>
            <input
              type="password"
              onChange={this.update("password")}
              value={this.state.password}
            />

            <p>First Name</p>
            <input
              type="text"
              onChange={this.update("first_name")}
              value={this.state.first_name}
            />

            <p>Last Name</p>
            <input
              type="text"
              onChange={this.update("last_name")}
              value={this.state.last_name}
            />

            <p>Address</p>
            <input
              type="text"
              onChange={this.update("address")}
              value={this.state.address}
            />

            <input type="submit" value="Update Account" id="edit-form-submit" />
          </form>
        </div>
      );
    }
  }
}

export default UpdateUserForm;
