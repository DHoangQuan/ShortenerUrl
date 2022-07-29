# README

Firstly, I would like to say sorry for not complete all the requirements that you give for me by personal reason. I just did this repo yesterday(28-07), and plant for work with BE and FE. but just finished the BE repo.

The postman scipt is provided in folder postman_script in this source

This project is using
* Ruby '~> 3.0.0'
* Rails '~> 6.1.6.1'
* sqlite3 '~> 1.4'

Please install these version of Ruby, Rails and Sqlite for

After cloning and install some material above project you must follow these seteps to run the project.

gem install bundler
bundle install

rails db:create
rails db:migrate
rails db:seed

open 2 terminals:
once run 'rails s'
once run 'rails jobs:work'

you will have default account with:
emai: abc@gmail.com

all accounts have default password is: 12345678

This project is structured by
Controller: which will be used for declaring endpoints for the API. It should not contain any business logic. The business logic will be written in the "Operations' folders.

Operation: it will handle the business logic of the controller which calls the operation. For example: The method create in the controller will call the create user operation in the user operation.

Services: This is where we will write the logic that will be reused in many operations or where we will call third-party services. In this case, the generating slug service and link stat service will be placed in the folder Services.

Serializer: where we define and custom which attributes will be return for the FrontEnd

Each request will be validated by using devise token Auth

Fast-json is the standard for json format which will return information of project

All the params will be converted from CamelCase to SnakeCase by json_param_key_transform in config/initializers folders


