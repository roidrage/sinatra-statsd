require 'sinatra'

$statsd = Statsd.new 'localhost', 9125

get '/' do
  $statsd.increment 'visits'
  "Hello, world"
end
