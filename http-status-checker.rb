require 'sinatra'
require 'net/http'


get '/' do
  erb :table
end

post '/' do
  @responses = params[:urls].split("\n").map do |url|
    response = Net::HTTP.get_response(URI.parse(url))
    [url, response.code, response['location']]
  end
  erb :table
end