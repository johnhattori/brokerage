require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'
require "pry"

ActiveRecord::Base.establish_connection(
  :adapter => 'postgresql',
  :host => 'localhost',
  :username => 'johnhattori',
  :password => '',
  :database => 'brokerage',
  :encoding => 'utf8'
)

require_relative "client"
require_relative "stock"
require_relative "portfolio"


get "/" do
  @clients = Client.all
  erb :index
end

get "/new_client" do
  erb :new_client
end

post "new_client" do
  @client = Client.new(params[:client])

  if @client.save
    @portfolio = Portfolio.create(params[:portfolio])
    @client.update_attributes(:portfolio_id => @portfolio.id)
    redirect "/"
  else
    erb :new_client
  end

end

get "/new_stock" do
  @stock = Stock.new(params[:stock])

  if @stock.save
    @stock.update_attributes(symbol => @symbol)
    redirect "/"
  else
    erb :new_stock
  end

end

post "new_stock" do
  @stock = Stock.new(params[:stock])

end

get "/new_portfolio" do
  erb :new_portfolio
end


