
# Project

This website application is meant to...


## Installation

After cloning the repository:

In your terminal type:

```ruby
$ bundle install
```
then type...

    touch .env 

This will create an env file where you can store your session_secret


Inside the '.env' file 

    SESSION_SECRET="whatever you want your session secret to be"

*preferably use SecureRandom

At this go ahead and migrate the db with;

    rake db:migrate

Now you should be able to start it up by going to your terminal and typing;

    shotgun

Pull up your local server in a browser and have fun!

## Usage

Use bin/run within the 'Ballers' folder inside your terminal to run the program.

Follow the prompts and have fun!

