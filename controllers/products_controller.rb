class ProductsController < ApplicationController
  around_filter :shopify_session, :except => 'welcome'

  def welcome
    current_host = "#{request.host}#{':' + request.port.to_s if request.port != 80}"
    @callback_url = "http://#{current_host}/login"
  end

  def index
    @products = Product.all

    @shopify_products = ShopifyAPI::Product.find(:all)

    @product_attributes = ["id","title","price_range"]
  end

  def show
    @product = Product.find(params[:id])

    Product.import
  end

  def new
  end

  def create
    @product = Product.new(product_params)

    @product.save
    redirect_to @product
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy

    redirect_to products_path
  end

  private
    def product_params
      params.require(:product).permit(:id, :title, :price)
    end

end
