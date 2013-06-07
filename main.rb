# require 'sinatra'
# require 'sinatra/reloader'
# require 'sinatra/activerecord'


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
  @stock = Stock.all
  @portfolio =Portfolio.all
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
  erb :new_stock
end

post "new_stock" do
  @stock = Stock.new(params[:stock])

    if @stock.save
      @stock = Stock.create(params[:stock])
      @stock.update_attributes(symbol => @symbol)
      redirect "/"
    else
      erb :new_stock
    end
end

get "/new_portfolio" do
  erb :new_portfolio
end

post "new_portfolio" do
  @portfolio = Portfolio.new(params[:portfolio])

    if @portfolio.save
      @portfolio = Portfolio.create(params[:portfolio])
      @portfolio.update_attributes(portfolio => @portfolio)
      redirect "/"
    else
      erb :new_stock
    end
end

get "edit_portfolio/:portfolio_id" do
  @portfolio = Portfolio.find_by_id(params[:portfolio_id])
  erb :edit_portfolio
end

post "save_portfolio/:portfolio_id" do
  if@book = Book.find_by_id(params[portfolio_id])
    redirect "/"
  else
    erb :edit_portfolio
  end
end




























