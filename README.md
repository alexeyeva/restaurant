* Ruby version: 2.0.0
* Rails 4.0.1

1) Configuration
	*Database using: PostgreSQL 9.3.5
	*Run: bundle install
	*To run server use: rails s

2) Database creation
	*../user$ createdb databasename
	

3) Database initialization
	*In database.yml file use your name of database and your login and password
	*Run: rake db:migrate
	
	
4) How to run the test suite
	*../user$ rake test
	*../user$ rake spec

5) Deployment instructions
	*../user$ rake assets:precompile RAILS_ENV=production		 before deployment

