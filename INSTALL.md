[back](README.md) 

# BarterUp

#### Allison Mackey, 7/17/2020

## Setup/Installation Requirements 


**Users will need to install Ruby, Rails, psql and Postgres.**
<br>

[Click here](https://www.ruby-lang.org/en/documentation/installation/) for instructions on installing Ruby.
<br>

[Click here](https://dataschool.com/learn-sql/how-to-start-a-postgresql-server-on-mac-os-x/) for instructions on installing psql and Postgres.
<br>

After installing the above software, users will need to clone this project from the [github repository](). 
<br> 

Once cloned, use the command line to navigate to the project folder and install all necessary Ruby Gems with: `$ bundle install`

<br>

In the command line, type the following commands which will create the necessary database and launch a local server sso that you can access the application in a browser window.
``` $ rake db:create
    $ rake db:migrate
    $ rake db:test:prepare
    $ rails s
```

Now open a web browser and enter localhost:3000 in the address bar to view the project.