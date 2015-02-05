class ItemsController < ApplicationController
  around_filter :shopify_session, :except => 'welcome'

  def welcome
    current_host = "#{request.host}#{':' + request.port.to_s if request.port != 80}"
    @callback_url = "http://#{current_host}/login"
  end

  def index
    @item = Item.all

    # get 10 products
    @products = ShopifyAPI::Product.find(:all, :params => {:limit => 10})
  end

  def show
    @item = Item.find(params[:id])
  end

  def new
  end

  def create
    @item = Item.new(item_params)

    @item.save
    redirect_to @item
  end

  private
    def item_params
      params.require(:item).permit(:title, :price_range)
    end

end
