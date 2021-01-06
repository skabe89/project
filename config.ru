require './config/environment'
require 'dotenv/load'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

use Rack::MethodOverride
use SessionsController
use FollowsController
use MessagesController
use UsersController
use ProfileController
use ProductsController
run ApplicationController
