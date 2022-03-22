import React from "react";
import { Link } from "react-router-dom";

class LoginForm extends React.Component{
  constructor(props) {
    super(props);
    this.state = {
      email: "",
      password: "",
    };
    this.handleSubmit = this.handleSubmit.bind(this);
  }

  //CONTROLLED INPUT FORM METHODS
  handleSubmit(e) {
    e.preventDefault()
    const user = Object.assign({}, this.state);
    this.props.login(user)
  }

  update(field) {
    return e => this.setState({ [field]: e.currentTarget.value })
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
    const { formType, login } = this.props;
    const signup = (formType === 'signup');

    return(
      <div className="login-form-container">
        <div className="login-top-bar"><div className="eats-logo-white" /></div>
        <div className="login-form-contents">
          {this.renderErrors()}

          <form onSubmit={this.handleSubmit}>
            <h1 className="login-prompt">Email</h1>
              <input 
                type="text" 
                onChange={this.update("email")}
                value={this.state.email}
                className="login-input-field"
                placeholder="Enter email"
              />
            <h1 className="login-prompt">Password</h1>
            <input 
              type="password" 
              onChange={this.update("password")}
              value={this.state.password}
              className="login-input-field"
              placeholder="Enter password"
            />
            <button type="submit" className="login-login-button">
              Login <i className="fas fa-arrow-right fa-lg"></i>
            </button>
            <p className="login-text">Don't have an account with us?</p>
            <button onClick={()=>login({
              email: 'demo_user@email.com',
              password: 'password'
            })}
            className="login-demo-button"><i className="fas fa-save fa-lg"></i> Demo Login</button>
            <Link to={signup ? "/login" : "/signup"}
              id="login-signup-button"
              ><i className="fas fa-sign-in"></i>{signup ? "Log in" : "Sign up"}</Link>
          </form>
        </div>
      </div>
    )
  }
}

export default LoginForm;
