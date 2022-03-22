import React from 'react';
import { Link } from 'react-router-dom';
import UserModalContainer from '../user_modal/user_modal_container';
import CartContainer from "../cart/cart_container";

class NavBar extends React.Component {
  constructor(props) {
    super(props)
    this.state = {
      modalOpen: false,
      cartOpen: false
    }
    this.toggleModal = this.toggleModal.bind(this);
    this.renderModal = this.renderModal.bind(this);
  }

  toggleModal() {
    let setValue = !this.state.modalOpen;
    this.setState({ modalOpen: setValue })
  }

  renderModal() {
    if (this.state.modalOpen) {
      return <UserModalContainer toggleModal={this.toggleModal} />
    }
  }

  toggleCart() {
    let setValue = !this.state.cartOpen;
    this.setState({ cartOpen: setValue })
  }

  renderCart() {
    if (this.state.cartOpen) {
      return <CartContainer />
    }
  }

  render() {
    return (
      <nav className="nav-bar">
        <div className="nav-contents">
          <div className="left">
            <button onClick={() => this.toggleModal()} className="hamburger"><i className="fas fa-bars fa-lg"></i></button>
            <Link to="/" className="eats-logo" />
            <div className="method-slider">
              <Link className="delivery-button">Delivery</Link>
              <Link to="/pickup" className="pickup-button">Pickup</Link>
            </div>
              {/* Delivery Details/Address Modal button here */}
          <div className="search-bar">
            <i className="fas fa-search"></i>
            <input type='text' className="search-area" placeholder="Food, groceries, drinks, etc" />
          </div>
          </div>
          <div className="right">
            <button onClick={() => this.toggleCart()} className="cart-button"><i className="fas fa-shopping-cart"></i>Cart</button>
          </div>
        </div>
        {this.renderModal()}
        {this.renderCart()}
      </nav>
    )
  }
}

export default NavBar;