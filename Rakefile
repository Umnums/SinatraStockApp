ENV["SINATRA_ENV"] ||= "development"

require_relative './config/environment'
require 'sinatra/activerecord'
require 'open-uri'
require 'nokogiri'
require 'sinatra/activerecord/rake'
require 'sinatra/flash'

desc 'A console'
task :console do
    Pry.start
end