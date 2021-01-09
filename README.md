
# Project

This website application is meant to...


## Installation

After cloning the repository, in your terminal type:

```ruby
$ bundle install
```
then type...

    touch .env 

This will create an env file where you can store your session_secret


Inside the '.env' file 

    SESSION_SECRET="whatever you want your session secret to be"

*preferably use SecureRandom https://ruby-doc.org/stdlib-2.5.1/libdoc/securerandom/rdoc/SecureRandom.html

At this point go ahead and migrate the db with;

    rake db:migrate

Now you should be able to start it up by going to your terminal and typing;

    shotgun

Pull up your local server in a browser and have fun!

## Usage

There are a few example profiles inside the AddData migration. You can use those profiles
by using their 'username' and 'password' to log in or you can create your own account(s).
Have fun!

