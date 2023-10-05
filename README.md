# Healthy Dishes
The prototype of the 'Healthy Dishes' application allows users to place orders for dishes while excluding selected (allergenic) ingredients. Users can customize their orders by excluding specific ingredients they are allergic to, ensuring a safe and enjoyable dining experience. This application simplifies the ordering process by offering predefined meal kits rather than individual dishes.

## Features
* Allergen Exclusion: Users can exclude ingredients from their orders based on their allergies to ensure they receive safe and suitable meals.
* Order Creation: Users can create orders by selecting the excluded ingredients that determine their meal preferences.

## Getting Started
To run the application, you will need to have Ruby and Rails installed on your system. Application is built on Rails 7.0.8 and runs on Ruby 3.1.1 and is only suitable for PostgreSQL databases. The initial data for database is stored in `db/menu.yml`

## Installation

Clone the repository to your local machine and go to the directory
Install the required dependencies
```
bundle install
```
Prepare database and seed it
```
rails db:create
rails db:migrate
rails db:seed
```

## Usage
```
rails server
```
After starting the application with `rails server`, you can access it in your web browser by navigating to [http://localhost:3000](http://localhost:3000).

## Testing
* This application has tests written using RSpec.

## API Endpoints
The following endpoints are available in the API:

`GET /api/calculate_dishes_to_prepare`
Returns a json like

`[{name: 'Dish1', count: 5}, {name: 'Dish2', count: 2}, ...].`

sorted by count of Dishes which have to be cooked

## Contributing
If you would like to contribute to the Healthy Dishes, please feel free to fork the repository and submit a pull request. We welcome contributions of all kinds, including bug reports, feature requests, and code improvements.

License
The Theatre Application is released under the MIT License.
