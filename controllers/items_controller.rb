class ItemsController < ApplicationController
  around_filter :shopify_session, :except => 'welcome'

  def welcome
    current_host = "#{request.host}#{':' + request.port.to_s if request.port != 80}"
    @callback_url = "http://#{current_host}/login"
  end



  def index
    @items = Item.all

    @products = ShopifyAPI::Product.find(:all, :params => {:limit => 10})
  end

  def show
    @item = Item.find(params[:id])

    Item.import
    
  end

  def new
  end

  def create
    @item = Item.new(item_params)

    @item.save
    redirect_to @item
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy

    redirect_to items_path
  end

  private
    def item_params
      params.require(:item).permit(:title, :price_range)
    end

end
