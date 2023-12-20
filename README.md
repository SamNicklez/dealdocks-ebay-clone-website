### README for the DealDocks eBay Clone Repository

#### Repository Overview
The [DealDocks eBay Clone](https://github.com/SamNicklez/dealdocks-ebay-clone) repository is a Ruby on Rails application that mimics the functionality of an online marketplace similar to eBay. It is designed to provide a platform for users to list, view, and purchase items.

#### Project Description
This project is a web application built using Ruby on Rails. It allows users to create listings for items they want to sell, browse items listed by others, and purchase items. The application includes features such as user authentication, item listing, search functionality, and transaction processing.

#### Key Features
- **User Authentication**: Users can sign up, log in, and manage their profile.
- **Item Listing**: Users can list items for sale, including details like title, description, price, and images.
- **Search Functionality**: The application includes a search feature to find items based on various criteria.
- **Transaction Processing**: Users can purchase items, and the application handles the transaction process.

#### Getting Started
1. **Prerequisites**:
   - Ruby 2.6.6
   - Rails 4.2.10
   - ImageMagick (for image processing)

2. **Installation**:
   - Clone the repository.
   - Run `bundle install --without production` to install the required gems.
   - Set up the database with `rake db:drop db:create db:migrate`.
   - Seed the database with `rake db:seed`.

3. **Environment Variables**:
   - Create a `.env` file.
   - Add `GOOGLE_CLIENT_ID` and `GOOGLE_CLIENT_SECRET` for Google authentication.

4. **Starting the Server**:
   - Use `rails server` to start the local server.

#### Project Structure
- **Controllers**: Handle the application logic (e.g., [`items_controller.rb`](https://github.com/SamNicklez/dealdocks-ebay-clone/blob/main/app/controllers/items_controller.rb)).
- **Models**: Represent data and business logic (e.g., [`item.rb`](https://github.com/SamNicklez/dealdocks-ebay-clone/blob/main/app/models/item.rb)).
- **Views**: Display the user interface (e.g., [`show.html.haml`](https://github.com/SamNicklez/dealdocks-ebay-clone/blob/main/app/views/items/show.html.haml)).
- **Assets**: Contain CSS, JavaScript, and images (e.g., [`application.css`](https://github.com/SamNicklez/dealdocks-ebay-clone/blob/main/app/assets/stylesheets/application.css)).

#### Testing
- The repository includes RSpec tests for models and controllers (e.g., [`item_spec.rb`](https://github.com/SamNicklez/dealdocks-ebay-clone/blob/main/spec/models/item_spec.rb)).
