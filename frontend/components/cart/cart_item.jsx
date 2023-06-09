import React from "react";
import * as Util from "../../util/util";

class CartItem extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      item: this.props.item,
      selected: 0,
    };
  }

  // Helper method to create dropdown menu from 0-100, where 0 is "Remove"
  // also sets default value to current quantity of the item
  drawMenu() {
    const options = [];
    for (let i = 0; i < 100; i++) {
      options.push(i);
    }

    const selected = this.props.item.quantity;
    return (
      <select defaultValue={selected} onChange={(e) => this.handleChange(e)}>
        {options.map((option) => {
          return (
            <option key={option} value={option}>
              {option === 0 ? "Remove" : option}
            </option>
          );
        })}
      </select>
    );
  }

  // Helper method to change global cart state based on selection
  // it will either update or remove the item based on quantity selected
  handleChange(e) {
    const { removeCartItem, updateCartItem } = this.props;
    const { item } = this.state;
    const quantity = parseInt(e.target.value);

    if (e.target.value === "0") {
      removeCartItem(item.quantity, item);
    } else {
      updateCartItem(quantity, item);
    }
    Util.saveState({
      entities: {
        cart: this.props.cart,
      },
    });
  }

  // Conditional render of cart item based on whether or not the item has an
  // image attached to it
  drawContainer(item) {
    if (item.photoUrl) {
      return (
        <li>
          {this.drawMenu()}

          <h3>{item.item_name}</h3>

          <p>${parseFloat(item.item_price).toFixed(2)}</p>

          <img src={item.photoUrl} alt={`${item.item_name} image`} />
        </li>
      );
    } else {
      return (
        <li>
          {this.drawMenu()}

          <h3>{item.item_name}</h3>

          <p>${parseFloat(item.item_price).toFixed(2)}</p>
        </li>
      );
    }
  }

  render() {
    const item = this.state.item;

    return this.drawContainer(item);
  }
}

export default CartItem;
