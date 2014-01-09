require 'sinatra'
require 'net/http'

get '/' do
  erb :table
end

post '/' do
  urls = params[:urls].split("\n").map{|x| x.gsub(/^\W+/, '').gsub(/\W+$/, '')}.reject(&:empty?)
  @responses = urls.map do |url|
    response = Net::HTTP.get_response(URI.parse(url))
    [url, response.code, response['location']]
  end
  erb :table
end