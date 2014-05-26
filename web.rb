require 'sinatra'
require 'statsd'

$statsd = Statsd.new 'localhost', 9125

get '/' do
  $statsd.increment 'visits'
  "Hello, world"
end
