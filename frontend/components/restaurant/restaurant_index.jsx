import React from "react";
import * as Util from "../../util/util";
import MenuItemContainer from "./menu_item_container";

class RestaurantIndex extends React.Component {
  constructor(props) {
    super(props)
    this.state = {
      loading: true,
      itemOpen: false
    }

    this.openButtonContents = this.openButtonContents.bind(this);
    this.renderMenuItem = this.renderMenuItem.bind(this);
    this.renderItemModal = this.renderItemModal.bind(this);
    this.toggleItemModal = this.toggleItemModal.bind(this);
  }

  // get restaurant, and knock loading screen off after mount and fetch
  componentDidMount() {
    const id = this.props.match.params.restaurantId
    this.props.fetchRestaurant(id)
      .then(action => this.setState({
          loading: false,
          restaurant: action.restaurant
        }))
  }

  // fetch restaurant if url changes on refresh
  componentDidUpdate(prevProps) {
    const { restaurant, fetchRestaurant } = this.props;
    const id = restaurant.id;

    if (this.props.location.pathname !== prevProps.location.pathname) {
      fetchRestaurant(id).then(action => {
        this.setState({ restaurant: action.restaurant })
      })
    }
  }

  // change state to render modal
  toggleItemModal(item) {
    const newValue = !this.state.itemOpen;
    this.setState({ itemOpen: newValue, clickedItem: item })
  }

  // if state is open, render modal
  renderItemModal() {
    if (this.state.itemOpen) {
      return <MenuItemContainer
        item={this.state.clickedItem}
        toggleItemModal={this.toggleItemModal} />
    }
  }

  // set button to either + or item quantity
  openButtonContents(id) {
    const { cart } = this.props;
    if (cart) {
      if (Object.keys(cart).includes(id)) {
        return `${cart[id].quantity}`
      } else {
      return (<i className="fa-solid fa-plus"></i>)
      }
    }
  }

  // if the item has an image, render the container with the image
  // otherwise, render the container with no image and different styling
  renderMenuItem(item, id) {
    if (item.photoUrl) {
      return (
        <div className="menu-item-container"
          key={id}
          onClick={() => this.toggleItemModal(item)}>

          <button 
            className="menu-open-item"
            onClick={() => this.toggleItemModal(item)}>
              {this.openButtonContents(id)}
          </button>

          <div className="menu-item-info">
            <div className="menu-item-photo-wrapper">
              <img src={item.photoUrl} className="menu-item-photo"></img>
            </div>
            <div className="menu-item-name">{item.item_name}</div>
            <div className="menu-item-price">
              ${parseFloat(item.item_price).toFixed(2)}
            </div>
            <div className="menu-item-description">{item.description}</div>
          </div>
        </div>
      )
    } else {
      return (
      <div className="menu-item-container"
        key={id}
        onClick={() => this.toggleItemModal(item)}>

          <button 
            className="menu-open-item"
            onClick={() => this.toggleItemModal(item)}>
              {this.openButtonContents(id)}
          </button>

        <div className="menu-item-info">
          <div className="menu-item-name">{item.item_name}</div>
          <div className="menu-item-price">
            ${parseFloat(item.item_price).toFixed(2)}
          </div>
          <div className="menu-item-description">{item.description}</div>
        </div>
      </div>
      )
    }
  }

  renderDescription(description) {
    let words = description.split(" ");
    words = words.map(word => {
      let split = word.split("-");
      if (split.length > 1) {
        return split.join(" ")
      } else {
        return word
      }
    })
    return words.join(", ");
  }

  render() {
    // render loading screen if component has not loaded yet
    const { loading } = this.state;
    if (loading) {
      return (
        <div className="loading-screen-bg">
          <div className="loading-element"></div>
        </div>
      )
    }
    // deconstruct props and take restaurant object
    const restaurant = this.state.restaurant;
    // set document title to restaurant info
    document.title = `Order ${restaurant.name} (${restaurant.address})`

    // set variables to clean syntax below
    const menu = restaurant.menu;
    const timePrompt = Util.timeDifferencePrompt(restaurant.hours)

    return (
      <div id="restaurant-page-container">
        <div id="restaurant-banner-wrapper">
          <img src={restaurant.photoUrl} id="restaurant-banner" />
        </div>

        <div id="restaurant-info">
          <div id="restaurant-page-name">{restaurant.name}</div>
          <div id="restaurant-small">
            <div id="restaurant-small-info">
              {this.renderDescription(restaurant.description)}
            </div>
            <i className="fas fa-star"></i> {Util.addZero(restaurant.rating)} ({restaurant.review_count} Ratings) • {restaurant.price_rating} • {timePrompt}
          </div>
        </div>

        <div id="menu-items-wrapper">
          <div id="menu-items-list">
            {Object.keys(menu).map(id => {
              const item = menu[id];
              return (
                this.renderMenuItem(item, id)
              )})}
          </div>
        </div>

        {this.renderItemModal()}
      </div>
    )
  }
}

export default RestaurantIndex;