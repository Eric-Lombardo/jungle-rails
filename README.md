# Jungle

A mini e-commerce application built with Ruby on Rails 4.2

This project was created to learn a new programming langauge and framework.

## Walkthrough
### On page load
A user is shown all the products offered at the company. Each product displays their name, price, description and a badge that indicates if a product is sold out. If a product doesn't display a "Sold out" badge this indicates the product has at least 1 quantity in stock. If user would like to learn more about a product they can click on any product to see additional details. From the homepage, a user can add any product to their cart by clicking on the blue "Add" button.

### Navbar
- Both the <strong>Jungle</strong> logo and <strong>Home</strong> will redirect you back to the product listings
- <strong>About Us</strong>: takes you to simple page that describes the company
- <strong>Categories</strong>: A dropdown menue where a user can filter the displayed products by categories
- <strong>Admin</strong>: only accessible with admin credentials. See section below for more details
- <strong>My Cart</strong>: After a user has added products to their cart they can click on this link to view all the products in their cart and to procedd to checkout
- <strong>Login</strong>: existing users can login
- <strong>Sign-Up</strong>: new users can sign up

### Admin nav-link
#### Username: Jungle
#### Password: book
After filling out the correct credentials to access these pages an admin can:
1. view all products
1. create new products
2. delete existing products
3. view all categories
3. create new categories
4. view how many products are currently in the database
5. view how many categories are currently in the database

* <strong>Dashboards</strong> dropdown option will display the product and category counts in the database
* <strong>Products</strong> dropdown option will display a detailed view of all the products. From here the admin can delete an existing product by clicking on the red trash can button. They can also create a new product by clicking on the blue "+ New product" button. From here they can fill out a form with the new product's details to enter a new product tot eh database.
* <strong>Categories</strong> dropdown option is very similar to the <strong>Products</strong> option, however the admin cannot delete an existing category but is only allowed to create new ones.

### Cart
If the cart is empty a warning will instruct the user to fill it up by adding items. Once the cart has at least 1 item they can view the products in their cart. From here, a user can increase or decrease the quantity of each product before checking out. To checkout out, click the blue "Pay with card" button. Once the user has filled out their credit card information (for testing purposes see the section below "Stripe testing") they are taken to a summary of their purchase.

### Login
Displays a form where returning existing users can log in. Once logged in, the navabr will display the users name. Also, with every successful order completion an email will be sent that was used to sign-up (feature not yet implemented).

### Sign-up 
Users can sign up for an account by filling out the form. The benefit of signing up is that an email will be sent with each successful checkout (feature not yet implemented). Users are not forced to sign-up. Any visitor can still shop and checkout.






## Setup
1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rake db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Stripe Testing
Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies
* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe
