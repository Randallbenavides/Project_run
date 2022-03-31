import React from "react";
import { Link } from "react-router-dom";
import SplashNavContainer from "./splash_nav_container"

const BG_IMG_URLS = [
  "https://jwong-eats-seeds.s3.amazonaws.com/BG1.png",
  "https://jwong-eats-seeds.s3.amazonaws.com/BG2.png",
  "https://jwong-eats-seeds.s3.amazonaws.com/BG3.png",
  "https://jwong-eats-seeds.s3.amazonaws.com/BG4.png"
]

function randomUrl() {
  return BG_IMG_URLS[Math.floor(Math.random() * BG_IMG_URLS.length)]
}

class Splash extends React.Component {
  constructor(props) {
    super(props)
    this.state = {
      prompt: false
    }

    this.signinPrompt = this.signinPrompt.bind(this);
    this.promptSignin = this.promptSignin.bind(this);
  }

  // Pseudo-error when Find Food is clicked
  signinPrompt() {
    if (this.state.prompt) {
      return <div className="auth-errors">Please sign in first.</div>
    }
  }

  // Helper method to toggle whether or not pseudo-error is displayed
  promptSignin() {
    this.setState({ prompt: true })
  }

  render() {
    return (
      <div id="splash"
        style={{backgroundImage: `url(${randomUrl()})`}}>

        <SplashNavContainer />

        <div id="splash-body">
          <h1 id="splash-title">
            Order food to your door
          </h1>

          <div id="splash-fake-bar">
            <div id="splash-prefill-search">
              <i className="fas fa-map-marker-alt"></i> Union, NJ
            </div>

            <div id="splash-deliver">
              <i className="fas fa-clock"></i>
              <div id="splash-deliver-text">Deliver now </div>
              <i className="fas fa-angle-down"></i>
            </div>

            <button
              onClick={() => this.promptSignin()}
              id="splash-find-food">
                Find Food
            </button>
          </div>

          {this.signinPrompt()}
          <div id="splash-signin-prompt">
            <Link
              to="/login"
              id="splash-bottom-signin">
              Sign in </Link> to see restauraunts in the area.
          </div>
        </div>

        <div id="splash-myinfo-container">
          <div id="splash-myinfo-title">My Links: </div>

          <div id="splash-github-fill">
            <a href="https://github.com/JonJWong"
              id="github"
              target="_blank"
              rel="noopener noreferrer">
              <img
                src='https://jwong-eats-seeds.s3.amazonaws.com/github.png'
                id="splash-github-logo"
                alt="github-logo" />
            </a>
          </div>

          <div id="splash-linkedin-fill">
            <a href="https://www.linkedin.com/in/jonjwong/"
            id="linked"
            target="_blank"
            rel="noopener noreferrer">
              <img
                src="https://jwong-eats-seeds.s3.amazonaws.com/linkedin.png"
                id="splash-linkedin-logo"
                alt="splash-linkedin-logo" />
            </a>
          </div>

          <div id="splash-angel-fill">
            <a href="https://angel.co/u/jonathan-wong-75"
            id="angel"
            target="_blank"
            rel="noopener noreferrer">
              <img
                src="https://jwong-eats-seeds.s3.amazonaws.com/angellist.png"
                id="splash-angellist-logo"
                alt="splash-angellist-logo" />
            </a>
          </div>
        </div>
        
        <p id="credits">
          Note: Images on this site are property of their respective companies (Uber/UberEats, Red Lobster, Olive Garden).
          This site is for personal use only, and is in no way to be used for profit or gain.
          Copyright Disclaimer under Section 107 of the copyright act 1976, allowance is made for fair use for purposes such as criticism, comment, news reporting, scholarship, and research. Fair use is a use permitted by copyright statute that might otherwise be infringing. Non-profit, educational or personal use tips the balance in favour of fair use.
        </p>
      </div>
    )
  }
}

export default Splash