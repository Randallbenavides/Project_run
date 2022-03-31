<h1>JWongEats</h1>

Welcome to JWongEats, an <a href="http://ubereats.com/" target="_blank" rel="noopener noreferrer">
UberEats</a> inspired Full-Stack single-page website, where you can browse and order from restaurants local to Union, New Jersey[^1][^2].

<img src="https://github.com/JonJWong/JWong-Eats/blob/main/app/assets/images/readme-main.png"></img>

<a href="https://jwong-eats.herokuapp.com/#/splash" target="_blank" rel="noopener noreferrer">Live Link</a>


<h2 id="table-of-contents">Table of Contents</h2>

- [Features](#features)
- [Technologies Used](#technologies-used)
- [Future Plans](#future-plans)


<h2 id="features">Features</h2>

### Dynamic Searching

Users can search through available restaurants as shown:

<p align="center">
  <img src="https://media.giphy.com/media/SlK7350XmLG6LnUDHo/giphy.gif" alt="search-gif"></img>
</p>

Restaurants are fetched upon the site's initial load, and the searching is handled through JavaScript logic on the front-end. This saves time and computation, since there is no need for any AJAX requests or database queries.

```javaScript
filterResults(value) {
  const { restaurants } = this.props;
  const filtered = [];

  Object.keys(restaurants).forEach(id => {
    const restaurant = restaurants[id];
    if (restaurant.name.toLowerCase().includes(value)) {
      filtered.push(restaurant);
    }
  })
  
  return filtered;
}
```

This function iterates through the available restaurants, and saves the appropriate ones to a list. This list is then returned, and iterated through in another function to render the search results.

#
### Restaurant Filtering

The filtering of restaurants on the Delivery homepage is handled differently, to show another possible approach.

Users can select icons on the top of the screen that reflect categories that the available restaurants fall into. This is then dynamically rendered onto the page by accessing the database through rails (When a button is pressed, an AJAX request is sent with a category parameter).

<p align="center">
  <img src="https://media.giphy.com/media/DmZpv2ljRn4ExgZeni/giphy.gif"></img>
</p>

```ruby
def index
  if (params[:category])
    @restaurants = Restaurant.where("description like ?", "%#{params[:category]}%")
    render :index
  else
    @restaurants = Restaurant.all
    render :index
  end
end
```

When this controller action hits, it will either send back a JSON object containing the filtered results, or all restaurants. This approach allows one thunk-action to handle multiple scenarios.

The price filter works through the front-end, where the price buttons are toggle-able, to select or de-select a desired price range.

```javaScript
togglePriceRange(option, e) {
  e.currentTarget.classList.toggle('delivery-sort-button-selected');
  const newState = this.state;
  if (!newState.priceRange.some(ele => ele === option)
    && option !== "None") {
      newState.priceRange.push(option);
  } else if (option === "None") {
    newState.priceRange = [];
  } else {
    newState.priceRange = 
      newState.priceRange.filter(ele => ele !== option);
  }
  this.setState(newState);
}
```

The modified state is then used to filter the components accordingly:

```javaScript
sort(restaurants) {
  let options;
  if (this.state.priceRange.length > 0) {
    options = this.state.priceRange
  }

  const newRestaurants = {};
  
  Object.keys(restaurants).map(id => {
    let restaurant = restaurants[id];
    if (options?.includes(restaurant.price_rating)) {
      newRestaurants[id] = restaurant
    }
  })
  
  return newRestaurants;
}
```

#
### Order History

Users can see their past orders, as well as a breakdown of prices and quantities through the receipt.

<p align="center">
  <img src="https://media.giphy.com/media/zLaOtiz8fI7OypGpVD/giphy.gif"></img>
</p>

When a user checks out a cart, and a transaction is processed, the current prices of items are saved as a transaction in the database, independent from what the current item's prices are. That way, if the items were ever to change prices in the future, the price change would not affect any orders retroactively, and the integrity of the transaction table would remain.

#
<h2 id="technologies-used">Technologies used</h2>

- __Front End__: React.js, Redux

  - Supports front-end handling of cart, rendering of pages, and navigation.

  - Persists state to `localStorage` on crucial updates, such as adding/removing items from the cart.

- __Back End__: Ruby on Rails, with PostgreSQL database

  - Supports back-end server access, and acts as a middleware for the PostgreSQL database, manipulating the database where needed.
  
  - Handles User Authentication via session tokens which are then bootstrapped to the window and sent forward to the front-end.

- __Other__: Google Maps JavaScript API, Google Places API, Amazon AWS S3, JavaScript

  - Google Maps and Google Places were used to get accurate information about local restaurants, like name, address, review-count, rating, and pricing.
  
  - The Google Maps JavaScript API is also used to render the map with appropriate markers and infowindows on the Pickup page.
  
  - AWS S3 handles image hosting to allow for a more lightweight and modular implementation of the app. Images changed on the buckets will reflect on the site with no need to change the code.

  - Webpack and Babel.js transpile the code

- __Hosting__: JWongEats is hosted on heroku.

#
<h2 id="future-plans">Future Plans</h2>

- Add Google Geocoding, Distance Matrix API support to allow for ETA calculation for delivery.
- Add a post-checkout screen detailing the order information while showing route between restaurant and user.
- Add Omni-auth for Google and Facebook login options.


#
### Credit

- Images sourced from UberEats, Red Lobster, Olive Garden are property of their respective companies.

[^1]: Since there did not seem to be a consistent API to scrape menus and menu items from restaurants, all the menu and item seeding was done manually, which resulted in a limited selection (20 restaurants, 10 items each). Some of the restaurants that were brought up by the Maps API are also not available on UberEats, so the images had to be sourced directly from the restaurant, if they had any.

[^2]: Bunny Cafe is an imaginary restaurant based on my household, and our bunny, Kuro!