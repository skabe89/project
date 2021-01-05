ENV["SINATRA_ENV"] ||= "development"

require_relative './config/environment'
require 'sinatra/activerecord/rake'

desc "Drop databases because Sinatra's drop is broken"
task :drop do
  puts "dropping databases..."
  system "rm db/development.sqlite && rm db/test.sqlite && rm db/schema.rb"
end

desc "Resets database and starts shotgun"
task :reset_db do
  Rake::Task["drop"].execute
  Rake::Task["migrations"].execute  
  system "shotgun"
end
