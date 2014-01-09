require 'rubygems'
require 'sinatra'
require File.expand_path '../http-status-checker.rb', __FILE__

run Sinatra::Application
