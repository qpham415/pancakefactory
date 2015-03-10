class ProductsController < ApplicationController
  around_filter :shopify_session, :except => 'welcome'

  def welcome
    current_host = "#{request.host}#{':' + request.port.to_s if request.port != 80}"
    @callback_url = "http://#{current_host}/login"
  end

  def index
    @products = Product.all
    @shopify_products = ShopifyAPI::Product.find(:all)

    @variants = Variant.all
    @shopify_variants = ShopifyAPI::Variant.find(:all)
  end

  def show
    @product = Product.find(params[:id])
    @variants = Variant.all
  end

  def new
    Product.import
    Variant.import
    redirect_to products_path
  end

  def create
    @product = Product.new(product_params)

    @product.save
    redirect_to @product
  end

  def update
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy

    redirect_to products_path
  end

  private
    def product_params
      params.require(:product).permit!
    end

end
