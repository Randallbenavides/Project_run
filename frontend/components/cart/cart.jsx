import React from "react";
import CartItemContainer from "./cart_item_container";
import * as Util from "../../util/util";

class Cart extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      soon: false,
      processing: false
    }
    
    this.conditionalToggle = this.conditionalToggle.bind(this);
    this.delayCartClear = this.delayCartClear.bind(this);
    this.toggleOpen = this.toggleOpen.bind(this);
    this.closeAndRemove = this.closeAndRemove.bind(this);
    this.priceSum = this.priceSum.bind(this);
  }

  componentDidMount() {
    setTimeout(() => {
      this.toggleOpen();
    }, 10)
  }

  toggleOpen() {
    const cart = document.querySelector(".cart-modal-content");
    cart.classList.toggle("cart-modal-open");
    this.setState({ processing: true })
    setTimeout(() => {
      this.setState({ processing: false })
    }, 500)
  }

  conditionalToggle() {
    if (!this.state.processing) {
      this.closeAndRemove()
    }
  }

  closeAndRemove() {
    const { toggleCart } = this.props;
    this.toggleOpen();
    setTimeout(() => {
      toggleCart("cartOpen");
    }, 510)
  }

  sendCheckout() {
    const { checkout } = this.props;
    let transaction = {
      order: this.props.cart,
      userId: this.props.userId
    }
    checkout(transaction)
  }

  priceSum() {
    let sum = 0;
    
    let items;
    if (this.props.cart) {
      items = this.props.cart;
        Object.values(items).forEach(item => {
          sum += Util.priceMultiple(item.quantity, item.item_price)
        }
      )
    }
    if (sum === 0) {
      return "0.00"
    } else {
      return sum.toFixed(2)
    }
  }

  comingSoon() {
    const nextValue = !this.state.soon;
    this.setState({ soon: nextValue })
  }

  delayCartClear() {
    const { clearCart } = this.props;
    const button = document.querySelector("#cart-clear");
    button.textContent = "Clearing..."
    this.setState({ processing: true })
    setTimeout(() => {
      clearCart();
      button.textContent = "Cleared!"
      setTimeout(() => {
        this.closeAndRemove();
      }, 200),then(() => {
        this.setState({ processing: false })
      })
    }, 500)
  }

  renderSoon() {
    if (this.state.soon) {
      return (
        <div className="auth-errors cart-error">
          Group ordering is not available yet! Sorry for the inconvenience.
        </div>
      )
    }
  }

  render() {

    return (
      <div id="cart-modal">
        <div
          id="cart-modal-block"
          onClick={() => this.conditionalToggle()} />

        <div className="cart-modal-content">
          <button
            id="cart-close"
            onClick={() => this.conditionalToggle()}>
              <i className="fa-solid fa-x fa-lg"></i>
          </button>

          <div id="cart-header">
            <div id="cart-title">
              Your Cart
            </div>

            <div id="cart-address">
              Deliver to Union, NJ
            </div>

            <div id="cart-top-buttons">
              <button 
                id="cart-add-items"
                onClick={() => this.conditionalToggle()}>
                  <i className="fas fa-plus"></i> Add Items
              </button>

              <button
                id="cart-group-order"
                onClick={() => this.comingSoon()}>
                  <i className="fas fa-user-plus"></i> Group Order
              </button>
            </div>
          </div>

          {this.renderSoon()}

          <div id="cart-items">
            {Object.values(this.props.cart).map((item, i) => {
              return (
                <CartItemContainer item={item} key={i} />
              )
            })}
          </div>

          <button
            id="cart-clear"
            onClick={() => this.delayCartClear()}>
              Clear Cart
          </button>

          <div id="menu-checkout-wrapper">
            <div id="menu-checkout-container">
              <button id="menu-checkout"
                onClick={() => this.sendCheckout()}>
                  Go to checkout • ${this.priceSum()}
              </button>
            </div>
          </div>

        </div>
      </div>
    )
  }
}

export default Cart;