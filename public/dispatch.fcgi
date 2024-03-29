#!/home/kazlan/.rvm/rubies/ruby-1.9.3-p194/bin/ruby

ENV['RAILS_ENV'] ||= 'production' 

# Set GEM_PATH and GEM_HOME ("user" is your dreamhost user)
ENV['GEM_HOME'] ||= '/home/kazlan/.gems'
require 'rubygems'
require 'fcgi'
Gem.clear_paths

require File.join(File.dirname(__FILE__), '../config/environment')

class Rack::PathInfoRewriter
 def initialize(app)
   @app = app
 end

 def call(env)
   env.delete('SCRIPT_NAME')
   parts = env['REQUEST_URI'].split('?')
   env['PATH_INFO'] = parts[0]
   env['QUERY_STRING'] = parts[1].to_s
   @app.call(env)
 end
end

Rack::Handler::FastCGI.run  Rack::PathInfoRewriter.new(Optik::Application)