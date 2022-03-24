# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts("Destroying all existing records...")

sleep(0.1);
puts ("Destroying Users...")
User.destroy_all
puts("Users destroyed")

sleep(0.2)
puts("Destroying Restaurants...")
Restaurant.destroy_all
puts("Restaurants destroyed")

sleep(0.2)
puts("Destroying Menus...")
Menu.destroy_all
puts("Menus Destroyed")

sleep(0.2)
puts("Destroying MenuItems...")
MenuItem.destroy_all
puts("MenuItems Destroyed")

sleep(0.1)
puts("Resetting primary key sequence for: Users...")
ApplicationRecord.connection.reset_pk_sequence!('users')
puts("Reset!")

sleep(0.1)
puts("Resetting primary key sequence for: Restaurants...")
ApplicationRecord.connection.reset_pk_sequence!('restaurants')
puts("Reset!")

sleep(0.1)
puts("Resetting primary key sequence for: Menus...")
ApplicationRecord.connection.reset_pk_sequence!('menus')
puts("Reset!")

sleep(0.1)
puts("Resetting primary key sequence for: MenuItems...")
ApplicationRecord.connection.reset_pk_sequence!('menu_items')
puts("Reset!")

puts("Seeding demo user...")
demo_user = User.create({email: 'demo_user@email.com', password: 'password', first_name: 'John', last_name: 'Doe', address: '1 Wall Street'})

puts("Seeding restaurants...")
restaurants = Restaurant.create([
  {
    name: "Sofia's Italian Restaurant",
    address: "272 Morris Ave, Springfield NJ 07081",
    description: "",
    rating: 4.5,
    review_count: 407,
    price_rating: "$$",
    hours: "11:30AM - 9:00PM"
  },
  {
    name: "SIGNATURZ SPORTS BAR",
    address: "2586 Morris Ave, Union NJ 07083",
    description: "",
    rating: 4.4,
    review_count: 258,
    price_rating: "$",
    hours: "11:00AM - 2:00AM"
  },
  {
    name: "Cafe Z",
    address: "2333 Morris Ave, Union, NJ 07083",
    description: "",
    rating: 4.4,
    review_count: 290,
    price_rating: "$$",
    hours: "11:30AM - 10:00PM"
  },
  {
    name: "The Red Cadillac",
    address: "2258 Morris Ave, Union, NJ 07083",
    description: "",
    rating: 4.3,
    review_count: 967,
    price_rating: "$$",
    hours: "2:00PM - 10:00PM"
  },
  {
    name: "Cozy Corner Deli and Caterers",
    address: "558 Rahway Ave, Union, NJ 07083",
    description: "",
    rating: 4.2,
    review_count: 238,
    price_rating: "$",
    hours: "6:00AM - 4:00PM"
  },
  {
    name: "Chick Fil-A",
    address: "2319 US-22 W, Union, NJ 07083",
    description: "",
    rating: 4.4,
    review_count: 4577,
    price_rating: "$",
    hours: "6:30AM - 10:00PM"
  },
  {
    name: "McDonald's",
    address: "2404 US-22, Union, NJ 07083",
    description: "",
    rating: 3.7,
    review_count: 1447,
    price_rating: "$",
    hours: "12:01AM - 12-00AM"
  },
  {
    name: "The Halal Guys",
    address: "2317 US-22 Union, NJ 07083",
    description: "",
    rating: 4.3,
    review_count: 1486,
    price_rating: "%",
    hours: "11:00AM - 11:00PM"
  },
  {
    name: "Subway",
    address: "2497 US-22 W, Union, NJ 07083",
    description: "",
    rating: 4,
    review_count: 200,
    price_rating: "$",
    hours: "8:00AM - 9:00PM" 
  },
  {
    name: "Union Plaza Diner",
    address: "2466 US-22, Union, NJ 07083",
    description: "",
    rating: 4.1,
    review_count: 1650,
    price_rating: "$$",
    hours: "8:00AM - 10:00PM"
  },
  {
    name: "White Castle",
    address: "2458 US-22, Union, NJ 07083",
    description: "",
    rating: 4,
    review_count: 1072,
    price_rating: "$",
    hours: "9:00AM - 3:00AM"
  },
  {
    name: "Red Lobster",
    address: "2520 US-22, Union, NJ 07083",
    description: "",
    rating: 3.8,
    review_count: 2873,
    price_rating: "$$",
    hours: "11:00AM - 10:00PM"
  },
  {
    name: "Popeyes Louisiana Kitchen",
    address: "2568 US-22 East, Union, NJ 07081",
    description: "",
    rating: 3.9,
    review_count: 1074,
    price_rating: "$",
    hours: "10:30AM - 11:00PM"
  },
  {
    name: "IHOP",
    address: "2500 US-22 E, Union, NJ 07083",
    description: "",
    rating: 4.1,
    review_count: 1684,
    price_rating: "$",
    hours: "7:00AM - 10:00PM"
  },
  {
    name: "Starbucks",
    address: "2235 Springfield Ave, Union, NJ 07088",
    description: "",
    rating: 4.2,
    review_count: 825,
    price_rating: "$$",
    hours: "8:00AM - 9:00PM"
  },
  {
    name: "Panda Express",
    address: "2704 US-22, Union, NJ 07083",
    description: "",
    rating: 4,
    review_count: 779,
    price_rating: "$",
    hours: "11:00AM - 7:00PM"
  },
  {
    name: "TGI Fridays",
    address: "40 US-22, Springfield, NJ 07081",
    description: "",
    rating: 3.5,
    review_count: 1657,
    price_rating: "$$",
    hours: "11:00AM - 1:00AM"
  },
  {
    name: "Chipotle Mexican Grill",
    address: "101 US-22, Springfield, NJ 07081",
    description: "",
    rating: 3.7,
    review_count: 1394,
    price_rating: "$",
    hours: "10:45AM - 10:00PM"
  },
  {
    name: "Olive Garden",
    address: "265 US-22, Springfield, NJ 07081",
    description: "",
    rating: 4.1,
    review_count: 2334,
    price_rating: "$$",
    hours: "11:00AM - 10:00PM"
  }
])

puts("Seeding Menus...")
menus = Menu.create([
  {
    restaurant_name: "Sofia's Italian Restaurant",
    restaurant_id: 1
  },
  {
    restaurant_name: "SIGNATURZ SPORTS BAR",
    restaurant_id: 2
  },
  {
    restaurant_name: "Cafe Z",
    restaurant_id: 3
  },
  {
    restaurant_name: "The Red Cadillac",
    restaurant_id: 4
  },
  {
    restaurant_name: "Cozy Corner Deli and Caterers",
    restaurant_id: 5
  },
  {
    restaurant_name: "Chick Fil-A",
    restaurant_id: 6
  },
  {
    restaurant_name: "McDonald's",
    restaurant_id: 7
  },
  {
    restaurant_name: "The Halal Guys",
    restaurant_id: 8
  },
  {
    restaurant_name: "Subway",
    restaurant_id: 9
  },
  {
    restaurant_name: "Union Plaza Diner",
    restaurant_id: 10
  },
  {
    restaurant_name: "White Castle",
    restaurant_id: 11
  },
  {
    restaurant_name: "Red Lobster",
    restaurant_id: 12
  },
  {
    restaurant_name: "Popeyes Louisiana Kitchen",
    restaurant_id: 13
  },
  {
    restaurant_name: "IHOP",
    restaurant_id: 14
  },
  {
    restaurant_name: "Starbucks",
    restaurant_id: 15
  },
  {
    restaurant_name: "Panda Express",
    restaurant_id: 16
  },
  {
    restaurant_name: "TGI Fridays",
    restaurant_id: 17
  },
  {
    restaurant_name: "Chipotle Mexican Grill",
    restaurant_id: 18
  },
  {
    restaurant_name: "Olive Garden",
    restaurant_id: 19
  }
])

puts("Seeding MenuItems...")
# Sofia's
# https://sofiasitalianrestaurant.com/dinner-menu
puts("Seeding Sofia's")
menu1_items = MenuItem.create([
  {
    menu_id: 1,
    item_name: "Penne ala Vodka Sauce",
    item_price: "17.95",
    description: "Fresh tomatoes and a touch of cream"
  },
  {
    menu_id: 1,
    item_name: "Penne ala Vodka Sauce with Salmon",
    item_price: "20.95",
    description: "Sauteed salmon, fresh tomatoes and a touch of cream"
  },
  {
    menu_id: 1,
    item_name: "Cheese Ravioli",
    item_price: "16.95",
    description: "Tomato basil sauce"
  },
  {
    menu_id: 1,
    item_name: "Spinach Ravioli",
    item_price: "18.95",
    description: "In a light pink sauce"
  },
  {
    menu_id: 1,
    item_name: "Chicken Parmigiana",
    item_price: "19.95",
    description: "Breaded chicken brease, marinara sauce toppped with mozzarella cheese"
  },
  {
    menu_id: 1,
    item_name: "Shrimp Scampi",
    item_price: "21.95",
    description: "Sauteed with garlic, olive oil & white wine"
  },
  {
    menu_id: 1,
    item_name: "Salmon Putanesca Sauce",
    item_price: "24.95",
    description: "Sauteed with tomatoes, capers, gaeta olives, and anchovies & garlic"
  },
  {
    menu_id: 1,
    item_name: "Shrimp Fra Diavolo",
    item_price: "21.95",
    description: "Spicy marinara sauce"
  },
  {
    menu_id: 1,
    item_name: "Sofia's Cold Seafood Salad",
    item_price: "14.95",
    description: ""
  },
  {
    menu_id: 1,
    item_name: "Soda",
    item_price: "3.00",
    description: "Coke, Diet Coke, Sprite, Seltzer"
  },
])

puts("Seeding SIGNATURZ...")
# SIGNATURZ
# https://www.restaurantji.com/nj/union/team-dez-sports-bar-and-grill-/menu/#
menu2_items = MenuItem.create([
  {
    menu_id: 2,
    item_name: "Chicken & Waffles",
    item_price: "9.00",
    description: "Belgian waffle w/ crispy fried chicken strips"
  },
  {
    menu_id: 2,
    item_name: "Angus Beef Burger",
    item_price: "8.00",
    description: "Eight ounces of Angus beef, lettuce, tomato & onion on a toasted garlic bun"
  },
  {
    menu_id: 2,
    item_name: "Cheese Steak Sandwich",
    item_price: "9.00",
    description: "Steak w/ cooked onions, peppers and American cheese"
  },
  {
    menu_id: 2,
    item_name: "Supreme Nachos",
    item_price: "9.00",
    description: "Freshly fried tortillas covered in cheese sauce, beef, pico de gallo and jalapenos with a side of sour cream"
  },
  {
    menu_id: 2,
    item_name: "Bar Pie",
    item_price: "8.00",
    description: "Thin crust cheese pizza"
  },
  {
    menu_id: 2,
    item_name: "Crispy Fish Sliders",
    item_price: "7.00",
    description: "3 Mini crispy fried pieces of flounder served w/ a spicy aioli sauce"
  },
  {
    menu_id: 2,
    item_name: "Garlic Parmesan Fries",
    item_price: "6.00",
    description: "Crispy coated fries tossed in a fresh garlic & butter sauce"
  },
  {
    menu_id: 2,
    item_name: "Shrimp Basket",
    item_price: "13.00",
    description: "6 Fried or grilled jumbo shrimp w/ fries"
  },
  {
    menu_id: 2,
    item_name: "Spiced Iced Tea",
    item_price: "13.00",
    description: "SoCo, Captain Morgan, Peach Schnapps, Triple Sec, Vodka, and Cola"
  },
  {
    menu_id: 2,
    item_name: "Mind Eraser",
    item_price: "9.00",
    description: "Vokda, Kahlua, Club soda"
  },
])

puts("Seeding Cafe Z...")
# Cafe Z
# https://cafeznj.com/menu/
menu3_items = MenuItem.create([
  {
    menu_id: 3,
    item_name: "Chicken Wings",
    item_price: "9.95",
    description: "BBQ, Hot, Mild or Garlic"
  },
  {
    menu_id: 3,
    item_name: "'Z' Calamari",
    item_price: "10.95",
    description: "Calamari rings sauteed with olive oil, garlic, sherry wine, basil, and tomato marinara"
  },
  {
    menu_id: 3,
    item_name: "Our Famous Stuffed Meatball",
    item_price: "10.95",
    description: "Large meatball filled with seasoned ricotta cheese and topped with a spicy marinara sauce"
  },
  {
    menu_id: 3,
    item_name: "Garlic Shrimp",
    item_price: "9.95",
    description: "Rock shrimp in olive oil and butter"
  },
  {
    menu_id: 3,
    item_name: "Eggplant Parmigiana",
    item_price: "7.95",
    description: "Thinly sliced eggplant, egg-battered, sauteed and topped with mozzarerlla and marinara"
  },
  {
    menu_id: 3,
    item_name: "Casa di Napoli",
    item_price: "9.95",
    description: "Prosciutto, fresh mozzarella, sun-dried tomatoes, garlic, and olive oil"
  },
  {
    menu_id: 3,
    item_name: "San Remo",
    item_price: "8.95",
    description: "Fresh mozzarella, roasted peppers, prosciutto, and extra virgin olive oil"
  },
  {
    menu_id: 3,
    item_name: "Bianco Pizza",
    item_price: "8.50",
    description: "8 inch pizza with ricotta, mozzarella, garlic, and spinach"
  },
  {
    menu_id: 3,
    item_name: "Fettucine di Mare",
    item_price: "16.95",
    description: "Homemade fettucine in a pink cream sauce with garlic and real crab meat"
  },
  {
    menu_id: 3,
    item_name: "Rigatoni alla Vodka",
    item_price: "14.95",
    description: "Rigatoni, peas and diced prosciutto in a tomato basil sauce with vodka and a touch of cream"
  },
])

puts("Seeding The Red Cadillac...")
# The Red Cadillac
# https://www.theredcadillacnj.com/wp-content/uploads/2022/03/Dine-In-Menu.pdf
menu4_items = MenuItem.create([
  {
    menu_id: 4,
    item_name: "Abuelas Empanadas",
    item_price: "12.00",
    description: "Homemade pork empanadas"
  },
  {
    menu_id: 4,
    item_name: "Chef Paris' Guacamole",
    item_price: "13.00",
    description: "Fresh hass avocado, lime, cilantro & chiles"
  },
  {
    menu_id: 4,
    item_name: "Shrimp & Garlic",
    item_price: "15.00",
    description: "Mexican shrimp sauteed in garlic, paprika & a little heat"
  },
  {
    menu_id: 4,
    item_name: "Fish Tacos",
    item_price: "21.00",
    description: "Beer battered Atlantic Cod topped with slaw, cheese, pico & chipotle tartar"
  },
  {
    menu_id: 4,
    item_name: "Starberry Glazed Jalapeno Chicken Tacos",
    item_price: "19.00",
    description: "Jerk chicken tossed in our homemade strawberry glaze with picked white onions & Queso Fresco"
  },
  {
    menu_id: 4,
    item_name: "Shrimp Tempura Tacos",
    item_price: "21.00",
    description: "Battered Cadillac shrimp topped with avocado crema, cheese & pico"
  },
  {
    menu_id: 4,
    item_name: "Sangria",
    item_price: "12.00",
    description: "Red, White, or Rose"
  },
  {
    menu_id: 4,
    item_name: "Fresh Fruit Frozen Ritas",
    item_price: "14.00",
    description: "Strawberry, Mango, or Sangrita"
  },
  {
    menu_id: 4,
    item_name: "Ice Cold Beer",
    item_price: "12.00",
    description: "Budweiser, Corona, Heineken, Guinness"
  },
  {
    menu_id: 4,
    item_name: "Cadillac Wine",
    item_price: "12.00",
    description: "Merlot, Chardonnay, Cabernet, Sauvignon Blanc"
  },
])

puts("Seeding Cozy Corner...")
# Cozy Corner
# https://cozycornerdeli.net/lunch/
menu5_items = MenuItem.create([
  {
    menu_id: 5,
    item_name: "Buffalo Chicken Wrap",
    item_price: "7.20",
    description: "With lettuce, tomatoes & blue cheese dressing"
  },
  {
    menu_id: 5,
    item_name: "Chicken Cutlet",
    item_price: "7.20",
    description: "With lettuce, tomato & mayo"
  },
  {
    menu_id: 5,
    item_name: "Homemade Philly Cheesesteak",
    item_price: "7.20",
    description: "With sweet peppers, mushrooms & onions on Italian bread"
  },
  {
    menu_id: 5,
    item_name: "BLT",
    item_price: "5.70",
    description: "Bacon lettuce & tomato"
  },
  {
    menu_id: 5,
    item_name: "Cheeseburger",
    item_price: "5.20",
    description: "6 oz. jumbo burger with cheese"
  },
  {
    menu_id: 5,
    item_name: "Spicy Veggie Burger",
    item_price: "6.20",
    description: "With avocado, grilled onions, tomato & sriracha"
  },
  {
    menu_id: 5,
    item_name: "Fish & Chips",
    item_price: "8.05",
    description: "With tartar sauce"
  },
  {
    menu_id: 5,
    item_name: "8 pc. Chicken Wings",
    item_price: "8.50",
    description: "W. french fries & your choice of mild, hot, honey BBQ, teriyaki or suicidal"
  },
  {
    menu_id: 5,
    item_name: "Turkey & Roast Beef",
    item_price: "8.20",
    description: "A tasty triple layered sandwich on thinly sliced rye with coleslaw & Russian dressing"
  },
  {
    menu_id: 5,
    item_name: "Veggie Sandwich",
    item_price: "5.35",
    description: "Lettuce, tomatoes, roasted peppers, onions & cucumbers"
  },
])

puts("Seeding Chick Fil-A...")
# Chick Fil-A
# https://www.ubereats.com/store/chick-fil-a-2319-us-highway-22-w/rNUwvOArRouIS9Q0xJfHEQ?diningMode=DELIVERY
menu6_items = MenuItem.create([
  {
    menu_id: 6,
    item_name: "Chick-fil-A® Chicken Sandwich",
    item_price: "5.56",
    description: "A boneless breast of chicken seasoned to perfection, freshly breaded, pressure cooked in 100% refined peanut oil and served on a toasted, buttered bun with dill pickle chips. Also available on a multigrain bun"
  },
  {
    menu_id: 6,
    item_name: "Chick-fil-A® Deluxe Sandwich",
    item_price: "6.75",
    description: "A boneless breast of chicken seasoned to perfection, freshly breaded, pressure cooked in 100% refined peanut oil and served on a toasted, buttered bun with dill pickle chips, Green Leaf lettuce, tomato and American cheese. Also available on a multigrain bun."
  },
  {
    menu_id: 6,
    item_name: "Chick-fil-A Waffle Potato Fries®",
    item_price: "2.99",
    description: "Waffle-cut potatoes cooked in canola oil until crispy outside and tender inside. Sprinkled with Sea Salt."
  },
  {
    menu_id: 6,
    item_name: "Chick-fil-A® Nuggets",
    item_price: "5.95",
    description: "Bite-sized pieces of boneless chicken breast, seasoned to perfection, freshly breaded and pressure cooked in 100% refined peanut oil. Available with choice of dipping sauce."
  },
  {
    menu_id: 6,
    item_name: "Cobb Salad",
    item_price: "11.99",
    description: "Chick-fil-A® Nuggets, freshly breaded and pressure-cooked, sliced and served on a fresh bed of mixed greens, topped with roasted corn kernels, a blend of shredded Monterey Jack and Cheddar cheeses, crumbled bacon, sliced hard-boiled egg and grape tomatoes. Prepared fresh daily. Served with Charred Tomato and Crispy Red Bell Peppers. Pairs well with Avocado Lime Ranch dressing."
  },
  {
    menu_id: 6,
    item_name: "Market Salad",
    item_price: "12.29",
    description: "Sliced grilled chicken breast served on a fresh bed of mixed greens, topped with crumbled blue cheese and a mix of red and green apples, strawberries and blueberries. Prepared fresh daily. Served with Harvest Nut Granola and Roasted Almonds. Pairs well with Zesty Apple Cider Vinaigrette."
  },
  {
    menu_id: 6,
    item_name: "Smokehouse BBQ Bacon Sandwich",
    item_price: "10.09",
    description: "A boneless breast of chicken, marinated with a special blend of seasonings and grilled for a tender and juicy backyard-grilled taste, served on a toasted, buttered sweet yeast bun with Colby-Jack cheese, bacon hand-tossed in a brown sugar and pepper blend, and Green Leaf lettuce. Topped with zesty Smokehouse BBQ sauce."
  },
  {
    menu_id: 6,
    item_name: "Chick-fil-A® Grilled Chicken Club Sandwich",
    item_price: "10.09",
    description: "A lemon-herb marinated boneless breast of chicken, grilled for a tender and juicy backyard-smokey taste, served on a toasted Multigrain Brioche bun with Colby Jack cheese, applewood smoked bacon, Green Leaf lettuce and tomato. Pairs well with Honey Roasted BBQ Sauce."
  },
  {
    menu_id: 6,
    item_name: "Coca-Cola®",
    item_price: "2.69",
    description: "Fountain beverage. A product of The Coca-Cola Company."
  },
  {
    menu_id: 6,
    item_name: "Chocolate Chunk Cookie",
    item_price: "1.95",
    description: "Cookies have both semi-sweet dark and milk chocolate chunks, along with wholesome oats."
  },
])

puts("Seeding McDonald's...")
# McDonald's
# https://www.ubereats.com/store/mcdonalds-2404-us-22/SgmYBvXGTyOpO_WH9YFOFQ?diningMode=DELIVERY
menu7_items = MenuItem.create([
  {
    menu_id: 7,
    item_name: "Big Mac Meal",
    item_price: "10.99",
    description: "A Big Mac with a side of fries and a drink"
  },
  {
    menu_id: 7,
    item_name: "Crispy Chicken Sandwich",
    item_price: "4.69",
    description: "Chicken sandwich with pickles"
  },
  {
    menu_id: 7,
    item_name: "20 Piece McNuggets",
    item_price: "7.09",
    description: "20 Pieces of chicken McNuggets with sauce"
  },
  {
    menu_id: 7,
    item_name: "Medium French Fries",
    item_price: "3.89",
    description: "Golden-fried french fries"
  },
  {
    menu_id: 7,
    item_name: "Triple Cheeseburger",
    item_price: "4.49",
    description: "Triple cheeseburger with pickles, ketchup"
  },
  {
    menu_id: 7,
    item_name: "Filet O Fish Meal",
    item_price: "10.19",
    description: "Filet O Fish with a side of fries and a drink"
  },
  {
    menu_id: 7,
    item_name: "Hamburger - Happy meal",
    item_price: "4.49",
    description: "Our famous Happy Meal with a hamburger, apple slices, fries, and milk"
  },
  {
    menu_id: 7,
    item_name: "Apple Pie",
    item_price: "1.69",
    description: "Baked small apple pie"
  },
  {
    menu_id: 7,
    item_name: "Oreo McFlurry",
    item_price: "4.89",
    description: "Oreos and Vanilla Ice Cream blended together"
  },
  {
    menu_id: 7,
    item_name: "Coke",
    item_price: "2.09",
    description: "Medium sized Coke"
  },
])

puts("Seeding The Halal Guys...")
# The Halal Guys
# https://www.ubereats.com/store/the-halal-guys-union-nj/O1k53TVDR32V5FnWDxuGyw?diningMode=DELIVERY
menu8_items = MenuItem.create([
  {
    menu_id: 8,
    item_name: "Chicken & Beef Gyro Platter",
    item_price: "11.09",
    description: "Platters served with combo of chicken and beef gyro. Small platters are served with one white sauce and one red sauce. Regular platters are served with two white sauces and one red sauce."
  },
  {
    menu_id: 8,
    item_name: "Chicken Platter",
    item_price: "11.09",
    description: "Platters are served with one white sauce and one red sauce. Regular platters are served with two white sauces and one red sauce."
  },
  {
    menu_id: 8,
    item_name: "Beef Gyro Platter",
    item_price: "11.09",
    description: "Platters are served with one white sauce and one red sauce. Regular platters are served with two white sauces and one red sauce."
  },
  {
    menu_id: 8,
    item_name: "Falafel Platter",
    item_price: "11.09",
    description: "Platters are served with one white sauce and one red sauce. Regular platters are served with two white sauces and one red sauce."
  },
  {
    menu_id: 8,
    item_name: "Falafel Sandwich",
    item_price: "9.99",
    description: "Served with pita, lettuce, tomatoes and choice of toppings. Served with one white sauce and one red sauce."
  },
  {
    menu_id: 8,
    item_name: "French Fries",
    item_price: "3.49",
    description: "Classic crinkle-cut fried potatoes."
  },
  {
    menu_id: 8,
    item_name: "Baklava",
    item_price: "3.59",
    description: "Rich, sweet dessert pastry made of layers of filo filled with chopped nuts and sweetened and held together with syrup or honey. Allergen: Contains Gluten, Casein, Walnut, Cashew, and Pistachios"
  },
  {
    menu_id: 8,
    item_name: "Hummus",
    item_price: "3.59",
    description: "The Mediterranean spread made from cooked, mashed chickpeas or other beans, blended with tahini, olive oil, lemon juice, salt, and garlic. Allergen: Contains Sesame"
  },
  {
    menu_id: 8,
    item_name: "Bottled Coke",
    item_price: "2.79",
    description: "16oz bottle of Coca-Cola"
  },
  {
    menu_id: 8,
    item_name: "Snapple Lemon Tea",
    item_price: "2.79",
    description: "16oz bottle of Snapple Lemon Tea"
  },
])

puts("Seeding Subway...")
# Subway
# https://www.ubereats.com/store/subway-2497-route-22-west/vOV_1zLzQ8CKV9KDmwEKCw?diningMode=DELIVERY
menu9_items = MenuItem.create([
  {
    menu_id: 9,
    item_name: "Spicy Italian Footlong Regular Sub",
    item_price: "8.99",
    description: "Our Spicy Italian sandwich is a combo of pepperoni and Genoa salami. Pile on cheese, crunchy veggies, and finish it with your favorite sauce. Or don't. Your call."
  },
  {
    menu_id: 9,
    item_name: "Meatball Marinara Footlong Regular Sub",
    item_price: "8.99",
    description: "The Meatball Marinara sandwich is drenched in irresistible marinara sauce, sprinkled with Parmesan cheese, topped with whatever you want (no judgement) and perfectly toasted just for you."
  },
  {
    menu_id: 9,
    item_name: "Black Forest Ham Footlong Regular Sub",
    item_price: "8.99",
    description: "Our Black Forest Ham sandwich is a true classic. We add lettuce, baby spinach, cucumbers, green peppers and red onions to our delicious, thin-sliced ham and serve it on our Hearty Multigrain bread. Want cheese? Just ask."
  },
  {
    menu_id: 9,
    item_name: "B.L.T. 6 Inch Regular Sub",
    item_price: "6.71",
    description: "The sub that proves great things come in threes. In this case, those three things happen to be hickory smoked bacon, lettuce and juicy tomatoes. While there’s no scientific way of proving it, this B.L.T might be the most perfect sub in existence."
  },
  {
    menu_id: 9,
    item_name: "Italian B.M.T.® Footlong Pro (Double Protein)",
    item_price: "14.02",
    description: "The Italian B.M.T.® sandwich is filled with Genoa salami, spicy pepperoni, and Black Forest Ham. Big. Meaty. Tasty. Get it."
  },
  {
    menu_id: 9,
    item_name: "Veggie Patty 6 Inch Regular Sub",
    item_price: "7.67",
    description: "Delicious vegan patties with lettuce, tomatoes, cucumbers, green peppers and red onions, all served on our freshly baked Hearty Multigrain bread."
  },
  {
    menu_id: 9,
    item_name: "White Chip Macadamia nut",
    item_price: "0.69",
    description: "Chunks of Macadamia nuts and white chips in a ridiculously delicious cookie."
  },
  {
    menu_id: 9,
    item_name: "Raspberry Cheesecake",
    item_price: "0.60",
    description: "The flavor of sweet raspberry. The richness of cheesecake. Together in one awesome cookie creation."
  },
  {
    menu_id: 9,
    item_name: "Miss Vickie’s® Jalapeño",
    item_price: "1.42",
    description: "Made with jalapeño seasoning for enough heat to make things deliciously interesting. And every spicy bite is made with no artificial flavors or preservatives."
  },
  {
    menu_id: 9,
    item_name: "Dasani® Water",
    item_price: "2.19",
    description: "As delicious as our sandwiches are, they are even better when paired with the perfect side and drink or even adding a little something extra. With such a variety to choose from, there's truly something for every taste."
  },
])

puts("Seeding Union Plaza Diner...")
# Union Plaza Diner
# http://places.singleplatform.com/union-plaza-diner/menu?ref=google
menu10_items = MenuItem.create([
  {
    menu_id: 10,
    item_name: "10 Buffalo Chicken Wings",
    item_price: "11.95",
    description: "Cooked wing of a chicken coated in sauce or seasoning"
  },
  {
    menu_id: 10,
    item_name: "Chicken Fingers with Honey Mustard",
    item_price: "11.95",
    description: "Breaded or battered crispy chicken"
  },
  {
    menu_id: 10,
    item_name: "Vegetable Quesadilla",
    item_price: "10.95",
    description: "Served with Salsa, Sour Crea, and Guacaomole"
  },
  {
    menu_id: 10,
    item_name: "Chicken Quesadilla",
    item_price: "11.95",
    description: "Served with Salsa, Sour Cream, and Guacamole"
  },
  {
    menu_id: 10,
    item_name: "Potato Salad",
    item_price: "3.75",
    description: "Cold dish made from seasoned potatoes"
  },
  {
    menu_id: 10,
    item_name: "Coleslaw",
    item_price: "3.49",
    description: "Cabbage salad"
  },
  {
    menu_id: 10,
    item_name: "Turkey Club Sandwich",
    item_price: "12.95",
    description: "Bacon, lettuce, & tomato"
  },
  {
    menu_id: 10,
    item_name: "Chicken Salad Club Sandwich",
    item_price: "12.95",
    description: "Bacon, lettuce & tomato"
  },
  {
    menu_id: 10,
    item_name: "Grilled Chicken Sandwich",
    item_price: "12.45",
    description: "American cheese, lettuce, & tomato"
  },
  {
    menu_id: 10,
    item_name: "Chicken, Eggplant, & Melted Swiss Cheese Sandwich",
    item_price: "12.95",
    description: "Served on a hard roll with french fries"
  },
])

puts("Seeding White Castle...")
# White Castle
# https://www.ubereats.com/store/white-castle-2458-rt-22/ps_ruJhmRIilTnRVNM1dcA?diningMode=DELIVERY
menu11_items = MenuItem.create([
  {
    menu_id: 11,
    item_name: "THE ORIGINAL SLIDER",
    item_price: "1.00",
    description: "Our Original Slider, made with 100% beef, steam grilled on a bed of onions and served on a signature bun. NJ/NY topped with Ketchup."
  },
  {
    menu_id: 11,
    item_name: "CHEESE SLIDER CAL 170-180",
    item_price: "1.15",
    description: "Our Original Sliders, made with 100% beef, steamed grilled on a bed of onions and topped with a slice of American, Jalapeno, or Cheddar cheese."
  },
  {
    menu_id: 11,
    item_name: "DOUBLE CHEESE SLIDER CAL 300-330",
    item_price: "2.29",
    description: "Our Double Cheese Slider includes two 100% beef patties steam-grilled on a bed of onions plus two slices of melted cheese: American, Jalapeno, or Cheddar."
  },
  {
    menu_id: 11,
    item_name: "PANKO FISH SLIDER CAL 340-350",
    item_price: "2.29",
    description: "Tender, flaky Alaska Pollock with seasoned and crispy panko breading topped with American cheese."
  },
  {
    menu_id: 11,
    item_name: "CRAVE CASE WITH CHEESE CAL 5100-5400",
    item_price: "34.50",
    description: "30 Original Sliders, made with 100% beef, topped with cheese."
  },
  {
    menu_id: 11,
    item_name: "FRENCH FRIES CAL 330-350",
    item_price: "2.29",
    description: "Classic crinkle cut fries, crispy on the outside and tender on the inside."
  },
  {
    menu_id: 11,
    item_name: "MOZZARELLA CHEESE STICKS CAL 440",
    item_price: "2.99",
    description: "A classic – made with real mozzarella cheese and served with zesty marinara dipping sauce."
  },
  {
    menu_id: 11,
    item_name: "SHAKES CAL 460",
    item_price: "2.99",
    description: "SMALL VANILLA OR CHOCOLATE"
  },
  {
    menu_id: 11,
    item_name: "COCA-COLA Freestyle® Drinks",
    item_price: "2.39",
    description: "SMALL COCA-COLA DRINK"
  },
  {
    menu_id: 11,
    item_name: "MONSTER ENERGY CAL 210",
    item_price: "2.99",
    description: "Tear into a 16 ounce can of the meanest energy drink on the planet. Monster packs a powerful punch but has a smooth easy drinking flavor."
  },
])

puts("Seeding Red Lobster...")
# Red Lobster
# https://www.redlobster.com/menu
menu12_items = MenuItem.create([
  {
    menu_id: 12,
    item_name: "Lobster Lover's Dream®",
    item_price: "43.99",
    description: "A roasted rock lobster tail, butter-poached Maine lobster tail and lobster-and-shrimp linguini in a creamy lobster sauce. Served with melted butter, lemon and choice of two sides."
  },
  {
    menu_id: 12,
    item_name: "New! Date Night Feast For Two",
    item_price: "71.99",
    description: "Two butter-poached Maine lobster tails, two 7 oz. sirloins**, two jumbo grilled shrimp skewers, a shareable bacon mac & cheese in a creamy lobster cheese sauce and choice of sides."
  },
  {
    menu_id: 12,
    item_name: "Ultimate Surf & Turf**",
    item_price: "43.49",
    description: "A 6 oz. filet mignon**, butter-poached Maine lobster tail and bacon-wrapped sea scallops. Served with lemon and choice of two sides."
  },
  {
    menu_id: 12,
    item_name: "Shrimp Linguini Alfredo",
    item_price: "16.99",
    description: "Tender shrimp in a creamy garlic Alfredo sauce on a bed of linguini."
  },
  {
    menu_id: 12,
    item_name: "New England Clam Chowder",
    item_price: "5.49",
    description: ""
  },
  {
    menu_id: 12,
    item_name: "One Dozen Cheddar Bay Biscuits®",
    item_price: "5.29",
    description: "All entrées come with two warm, house-made Cheddar Bay Biscuits. Not enough? Order extra here."
  },
  {
    menu_id: 12,
    item_name: "Maine Lobster Tail - Classic",
    item_price: "13.99",
    description: "Served with lemon and melted butter."
  },
  {
    menu_id: 12,
    item_name: "Whole Desserts",
    item_price: "24.99",
    description: "Choose from Chocolate Wave, Vanilla Bean Cheesecake, Key Lime Pie or Triple-Chocolate Brownie."
  },
  {
    menu_id: 12,
    item_name: "Mtn Dew® 12 oz. Can",
    item_price: "1.85",
    description: ""
  },
  {
    menu_id: 12,
    item_name: "Pepsi® Family Pack (four 12 oz. cans)",
    item_price: "5.00",
    description: ""
  },
])

puts("Seeding Popeyes...")
# Popeyes
# https://www.ubereats.com/store/popeyes-union/Qj0PV4PbTduvftuVobYAng?diningMode=DELIVERY
menu13_items = MenuItem.create([
  {
    menu_id: 13,
    item_name: "Spicy Chicken Sandwich",
    item_price: "6.09",
    description: "Sandwich only"
  },
  {
    menu_id: 13,
    item_name: "Mixed Chicken (8 Pcs)",
    item_price: "31.70",
    description: "Includes one large signature side and four hot buttermilk biscuits."
  },
  {
    menu_id: 13,
    item_name: "8PC Nuggets A La Carte",
    item_price: "4.86",
    description: ""
  },
  {
    menu_id: 13,
    item_name: "Mixed Chicken (16 Pcs)",
    item_price: "54.88",
    description: "Includes three large signature sides and eight hot buttermilk biscuits."
  },
  {
    menu_id: 13,
    item_name: "Classic Flounder Fish Sandwich",
    item_price: "5.39",
    description: "Sandwich only"
  },
  {
    menu_id: 13,
    item_name: "Handcrafted Tenders (8 Pcs)",
    item_price: "20.72",
    description: "Include three sauces"
  },
  {
    menu_id: 13,
    item_name: "Spicy Flounder Fish Sandwich",
    item_price: "5.39",
    description: "Sandwich only"
  },
  {
    menu_id: 13,
    item_name: "Handcrafted Tenders (16 Pcs)",
    item_price: "36.58",
    description: "Include five sauces"
  },
  {
    menu_id: 13,
    item_name: "Mashed Potatoes with Cajun Gravy",
    item_price: "4.62",
    description: ""
  },
  {
    menu_id: 13,
    item_name: "Cajun Fries",
    item_price: "4.62",
    description: ""
  },
])

puts("Seeding IHOP...")
# IHOP
# https://www.ubereats.com/store/ihop-2500-route-22-e/uFrP7aYmRuGfcnFYlcNy-g?diningMode=DELIVERY
menu14_items = MenuItem.create([
  {
    menu_id: 14,
    item_name: "Belgian Waffle",
    item_price: "9.27",
    description: "Our house-made golden-brown Belgian waffle topped with whipped real butter."
  },
  {
    menu_id: 14,
    item_name: "Hash Browns",
    item_price: "4.51",
    description: ""
  },
  {
    menu_id: 14,
    item_name: "Pork Sausage Links",
    item_price: "4.51",
    description: ""
  },
  {
    menu_id: 14,
    item_name: "Hickory-Smoked Bacon Strips",
    item_price: "4.51",
    description: ""
  },
  {
    menu_id: 14,
    item_name: "Original Gluten-Friendly Pancakes - (Full Stack)",
    item_price: "10.89",
    description: "As tasty as the original, just gluten-friendlier. Four fluffy gluten-friendly pancakes topped with whipped real butter."
  },
  {
    menu_id: 14,
    item_name: "Strawberry Banana Pancakes",
    item_price: "11.24",
    description: "Little known fact: Strawberries and Bananas are best friends. Four fluffy buttermilk pancakes filled with fresh banana slices. Topped with glazed strawberries & more banana slices."
  },
  {
    menu_id: 14,
    item_name: "New York Cheesecake Pancakes",
    item_price: "11.47",
    description: "We’ve combined a New York classic with our classic pancakes. Four fluffy buttermilk pancakes filled with cheesecake bites & topped with glazed strawberries."
  },
  {
    menu_id: 14,
    item_name: "Swedish Crepes",
    item_price: "10.20",
    description: "Four delicate crepes topped with sweet-tart lingonberries & lingonberry butter."
  },
  {
    menu_id: 14,
    item_name: "Big Steak Omelette",
    item_price: "14.95",
    description: "Your hunger won’t be at steak with this one. Our omelette stuffed with steak, hash browns, green peppers, onions, mushrooms, tomatoes & Cheddar cheese. Served with our salsa."
  },
  {
    menu_id: 14,
    item_name: "Chicken Fajita Omelette",
    item_price: "13.91",
    description: "The perfect fiesta in one package. Our omelette stuffed with grilled chicken breast with Poblano & red bell peppers, roasted onions & Jack & Cheddar cheese blend. Served with salsa, sour cream & grilled Serrano pepper."
  },
])

puts("Seeding ...")
# menu15_items = MenuItem.create([
#   {
#     menu_id: ,
#     item_name: "",
#     item_price: "",
#     description: ""
#   },
#   {
#     menu_id: ,
#     item_name: "",
#     item_price: "",
#     description: ""
#   },
#   {
#     menu_id: ,
#     item_name: "",
#     item_price: "",
#     description: ""
#   },
#   {
#     menu_id: ,
#     item_name: "",
#     item_price: "",
#     description: ""
#   },
#   {
#     menu_id: ,
#     item_name: "",
#     item_price: "",
#     description: ""
#   },
#   {
#     menu_id: ,
#     item_name: "",
#     item_price: "",
#     description: ""
#   },
#   {
#     menu_id: ,
#     item_name: "",
#     item_price: "",
#     description: ""
#   },
#   {
#     menu_id: ,
#     item_name: "",
#     item_price: "",
#     description: ""
#   },
#   {
#     menu_id: ,
#     item_name: "",
#     item_price: "",
#     description: ""
#   },
#   {
#     menu_id: ,
#     item_name: "",
#     item_price: "",
#     description: ""
#   },
# ])

puts("Seeding ...")
# menu16_items = MenuItem.create([
#   {
#     menu_id: ,
#     item_name: "",
#     item_price: "",
#     description: ""
#   },
#   {
#     menu_id: ,
#     item_name: "",
#     item_price: "",
#     description: ""
#   },
#   {
#     menu_id: ,
#     item_name: "",
#     item_price: "",
#     description: ""
#   },
#   {
#     menu_id: ,
#     item_name: "",
#     item_price: "",
#     description: ""
#   },
#   {
#     menu_id: ,
#     item_name: "",
#     item_price: "",
#     description: ""
#   },
#   {
#     menu_id: ,
#     item_name: "",
#     item_price: "",
#     description: ""
#   },
#   {
#     menu_id: ,
#     item_name: "",
#     item_price: "",
#     description: ""
#   },
#   {
#     menu_id: ,
#     item_name: "",
#     item_price: "",
#     description: ""
#   },
#   {
#     menu_id: ,
#     item_name: "",
#     item_price: "",
#     description: ""
#   },
#   {
#     menu_id: ,
#     item_name: "",
#     item_price: "",
#     description: ""
#   },
# ])

puts("Seeding ...")
# menu17_items = MenuItem.create([
#   {
#     menu_id: ,
#     item_name: "",
#     item_price: "",
#     description: ""
#   },
#   {
#     menu_id: ,
#     item_name: "",
#     item_price: "",
#     description: ""
#   },
#   {
#     menu_id: ,
#     item_name: "",
#     item_price: "",
#     description: ""
#   },
#   {
#     menu_id: ,
#     item_name: "",
#     item_price: "",
#     description: ""
#   },
#   {
#     menu_id: ,
#     item_name: "",
#     item_price: "",
#     description: ""
#   },
#   {
#     menu_id: ,
#     item_name: "",
#     item_price: "",
#     description: ""
#   },
#   {
#     menu_id: ,
#     item_name: "",
#     item_price: "",
#     description: ""
#   },
#   {
#     menu_id: ,
#     item_name: "",
#     item_price: "",
#     description: ""
#   },
#   {
#     menu_id: ,
#     item_name: "",
#     item_price: "",
#     description: ""
#   },
#   {
#     menu_id: ,
#     item_name: "",
#     item_price: "",
#     description: ""
#   },
# ])

puts("Seeding ...")
# menu18_items = MenuItem.create([
#   {
#     menu_id: ,
#     item_name: "",
#     item_price: "",
#     description: ""
#   },
#   {
#     menu_id: ,
#     item_name: "",
#     item_price: "",
#     description: ""
#   },
#   {
#     menu_id: ,
#     item_name: "",
#     item_price: "",
#     description: ""
#   },
#   {
#     menu_id: ,
#     item_name: "",
#     item_price: "",
#     description: ""
#   },
#   {
#     menu_id: ,
#     item_name: "",
#     item_price: "",
#     description: ""
#   },
#   {
#     menu_id: ,
#     item_name: "",
#     item_price: "",
#     description: ""
#   },
#   {
#     menu_id: ,
#     item_name: "",
#     item_price: "",
#     description: ""
#   },
#   {
#     menu_id: ,
#     item_name: "",
#     item_price: "",
#     description: ""
#   },
#   {
#     menu_id: ,
#     item_name: "",
#     item_price: "",
#     description: ""
#   },
#   {
#     menu_id: ,
#     item_name: "",
#     item_price: "",
#     description: ""
#   },
# ])

puts("Seeding ...")
# menu19_items = MenuItem.create([
#   {
#     menu_id: ,
#     item_name: "",
#     item_price: "",
#     description: ""
#   },
#   {
#     menu_id: ,
#     item_name: "",
#     item_price: "",
#     description: ""
#   },
#   {
#     menu_id: ,
#     item_name: "",
#     item_price: "",
#     description: ""
#   },
#   {
#     menu_id: ,
#     item_name: "",
#     item_price: "",
#     description: ""
#   },
#   {
#     menu_id: ,
#     item_name: "",
#     item_price: "",
#     description: ""
#   },
#   {
#     menu_id: ,
#     item_name: "",
#     item_price: "",
#     description: ""
#   },
#   {
#     menu_id: ,
#     item_name: "",
#     item_price: "",
#     description: ""
#   },
#   {
#     menu_id: ,
#     item_name: "",
#     item_price: "",
#     description: ""
#   },
#   {
#     menu_id: ,
#     item_name: "",
#     item_price: "",
#     description: ""
#   },
#   {
#     menu_id: ,
#     item_name: "",
#     item_price: "",
#     description: ""
#   },
# ])

puts("Done seeding!")