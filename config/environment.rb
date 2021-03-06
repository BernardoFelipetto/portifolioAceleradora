require 'rubygems'
require 'bundler/setup'

require 'active_support/all'

require 'sinatra'
require 'sinatra/activerecord'

APP_ROOT = Pathname.new(File.expand_path('../../', __FILE__))
APP_NAME = APP_ROOT.basename.to_s

configure do
  set :root, APP_ROOT.to_path

  enable :sessions
  set :session_secret, ENV['SESSION_KEY'] || 'rubyrubyruby'

  set :views, File.join(Sinatra::Application.root, "app", "views")
end

Dir[APP_ROOT.join('app', 'controllers', '*.rb')].each { |file| require file }

require APP_ROOT.join('config', 'database')
