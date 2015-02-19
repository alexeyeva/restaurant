* Ruby version: 2.0.0
* Rails 4.0.1

* Configuration
*Database using: PostgreSQL 9.3.5
*Run: bundle install
*To run server use: rails s

* Database creation
	*../user$ createdb databasename
	

* Database initialization
	*In database.yml file use your name of database and your login and password
	*Run: rake db:migrate
	
	
* How to run the test suite
	*../user$ rake test
	*../user$ rake spec

* Deployment instructions
	*../user$ rake assets:precompile RAILS_ENV=production		 before deployment

