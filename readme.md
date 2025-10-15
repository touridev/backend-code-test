📦 Overview

This project is a simple checkout system that applies different discount offers to items in a shopping basket. The main goal is to demonstrate refactoring legacy code and applying OOP principles to a checkout process with various discount logic. The system applies discounts such as:

Buy 3, Get 1 Free for mangoes

Buy 2, Get 1 Free for apples and pears

50% off on bananas and pineapples

💡 Features

Discount Logic:

A "Buy 3, Get 1 Free" offer for mangoes (perfect for a fruit basket!).

A "Buy 2, Get 1 Free" offer for apples and pears (classic combo).

A "50% off" deal on bananas and pineapples (because who doesn’t love a good deal on fruit?).

Easy to Extend: The code is designed to be simple and flexible, so it’s easy to add new items or discount offers in the future.

Test Coverage: I’ve added tests using RSpec to ensure that all the discount rules are working as expected. This way, we can confidently say that the checkout system is reliable!

🚀 Getting Started

To get up and running with this checkout system on your local machine, follow these simple steps.

🧰 Prerequisites

Ruby (version 3.x or above) must be installed.

Bundler: Bundler helps manage the project’s dependencies. You can install it by running:

gem install bundler

📥 Installation

git clone https://github.com/touridev/backend-code-test.git

Navigate into the project folder:

cd backend-code-test

Install the project dependencies using Bundler:

bundle install


Now you're all set to use the system and test it!

🧪 Running Tests

To make sure everything is working correctly, you can run the RSpec tests:

rspec


If everything is correct, you should see that all tests pass!

💻 How to Use

Here’s an example of how you can use the checkout system to calculate the total price:

# Setup pricing rules for different items
pricing_rules = { apple: 10, mango: 200, banana: 30, pineapple: 100 }

# Initialize checkout with the pricing rules
checkout = Checkout.new(pricing_rules)

# Add some items to the basket
checkout.scan(:apple)
checkout.scan(:mango)
checkout.scan(:mango)

# Calculate the total price, with any applicable discounts
puts checkout.total  # This will print the discounted total, e.g. 600 for 4 mangoes

🛒 Example: Mango Discount

If you add 4 mangoes to the basket, the system will apply the "Buy 3, Get 1 Free" offer. So instead of paying for 4 mangoes at 200 each, you only pay for 3 (600 total).

🔧 Project Structure

Here’s a quick overview of the files in this project:

checkout.rb: Contains the Checkout class that handles the checkout process and discount logic.

checkout_spec.rb: Contains RSpec tests to make sure the discounts are applied correctly.

spec_helper.rb: The RSpec configuration file, needed to run the tests.
