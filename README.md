# Code Scholarships

### Setup
clone the project onto your desktop and go to the project directory in the terminal.
run postgres with the command
```
$ postgres
```
create the tables and seed data with:
```
$ rake db:create
$ rake db:migrate
$ rake db:seed
```
then run the rails server with:
```
$ PUBLISHABLE_KEY=pk_test_N7Zl57b3FJQuuLi0USv4EPBW SECRET_KEY=sk_test_iE8Vt6GoDt6ZlKulMBukrX0w rails s
```
then go to localhost:3000 in your web browser to see the app up and running.
