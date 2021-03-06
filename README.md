# Desk Challenge

This is a simple service that allows users to access their cases on Desk. Users can modify a case's
subject, description, priority, or status by submitting a simple form. They can also attach labels to 
their cases and alter their view of case lists by selecting a case filter. Finally, users can view all
available labels and submit new ones to Desk.

All data created locally will be replicated on the user's Desk account through background jobs processed
via Sidekiq. Additionally, there are three cron jobs that retrieve cases, filters, and labels data every
day. The frontend was constructed using Angular, and the backend relies on vanilla Rails. Critical
dependencies include PostgreSQL, Redis, and Bundler.

# Development
## Development Setup
1. Install dependencies: 'bundle install'
1. Add your development database. Copy `config/database.sample.yml` to `config/database.yml` and run `rake db:create` && `rake db:migrate`. 
1. Prepare your test database with `rake db:test:prepare`
1. After being granted access to the following Google Drive folder
(https://drive.google.com/?utm_source=en&utm_medium=button&utm_campaign=web&utm_content=gotodrive&usp=gtd&ltmpl=drive&pli=1#folders/0BzV01gfNa8rgSG1ZQUM4N1dCTWc)
Copy the contents of the ENV file on Google drive to a new `.env` file located in your root directory.
1. Start sidekiq by running `foreman start`
1. Start the server (`rails s`) and navigate to http://localhost.com:3000

## Development Rake Tasks
- `rake scrape_cases_data` Retrieves cases data from Desk and any associated messages and labels
- `rake scrape_filters_data` Retrieves filters data from Desk and creates the appropriate associations with existing cases
- `rake scrape_labels_data` Retrieves labels data from Desk

## Test setup
The test suite uses Rspec, Capybara, Turnip, and Selenium. 
- To run all of the tests, run `rspec spec`. 
- To run the model tests, run `rspec spec/models`.
- To run the integration tests, run `rspec spec/integration`.
- To run the acceptance tests, run `rspec spec/acceptance`.
