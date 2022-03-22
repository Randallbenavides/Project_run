import React from "react";
import { Link } from "react-router-dom";

class SignUpForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      email: "",
      password: "",
      first_name: "",
      last_name: "",
      address: ""
    };
    this.handleSubmit = this.handleSubmit.bind(this);
  }

  //CONTROLLED INPUT FORM METHODS
  handleSubmit(e) {
    e.preventDefault()
    const user = Object.assign({}, this.state);
    this.props.signup(user)
  }

  update(field) {
    return e => this.setState({[field]: e.currentTarget.value})
  }

  //DISPLAY ERROR MESSAGES
  renderErrors() {
    const {errors} = this.props
    if(!errors) return null;
    return(
      <ul className="auth-errors">
        {errors.map((error,idx) => (
          <li key={idx}>
            {error}
          </li>
        ))}
      </ul>
    )
  }

  // LIFECYCLE METHODS
  componentDidMount() {
    this.unlisten = this.props.history.listen(() => {
      this.props.clearSessionErrors();
    });
  }

  componentWillUnmount() {
    this.unlisten();
  }  

  render() {
    const { login } = this.props;

    return(
      <div className="signup-form-container">
        <div className="signup-top-bar"><div className="eats-logo-white" /></div>
        <div className="signup-form-contents">
        {this.renderErrors()}
        
          <form onSubmit={this.handleSubmit}>
            <p className="signup-prompt">Email</p>
              <input 
                type="text" 
                onChange={this.update("email")}
                value={this.state.email}
                className="signup-input-field"
                placeholder="Enter email"
              />
            <p className="signup-prompt">Password</p>
              <input 
                type="password" 
                onChange={this.update("password")}
                value={this.state.password}
                className="signup-input-field"
                placeholder="Enter password"
              />
            <p className="signup-prompt">First Name</p>
              <input 
                type="text" 
                onChange={this.update("first_name")}
                value={this.state.first_name}
                className="signup-input-field"
                placeholder="Your first name"
              />
            <p className="signup-prompt">Last Name</p>
              <input 
                type="text" 
                onChange={this.update("last_name")}
                value={this.state.last_name}
                className="signup-input-field"
                placeholder="Your last name"
              />
            <p className="signup-prompt">Address</p>
              <input 
                type="text" 
                onChange={this.update("address")}
                value={this.state.address}
                className="signup-input-field"
                placeholder="Your address"
              />
            <p className="login-legal">By proceeding, you DO NOT consent to get calls or SMS messages, 
              including by automated dialer, from JWongEats and its affiliates to this number. 
              Text “STOP” to 89203 to opt out.</p>
            <button className="signup-signup-button" type="submit">Sign Up! <i className="fas fa-sign-in"></i></button>
          </form>
          <p className="signup-text">Don't want to sign up?</p>
          <button onClick={()=>login({
            email: 'demo_user@email.com',
            password: 'password'
          })}
          className="signup-demo-button"><i className="fas fa-save fa-lg"></i> Demo Login</button>
        </div>
      </div>
    )
  }
}

export default SignUpForm;