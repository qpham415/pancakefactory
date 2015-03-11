class VariantsController < ApplicationController
  around_filter :shopify_session, :except => 'welcome'

  def welcome
    current_host = "#{request.host}#{':' + request.port.to_s if request.port != 80}"
    @callback_url = "http://#{current_host}/login"
  end

  def create
    @product = Product.find(params[:product_id])
    @variant = @product.variants.create(variant_params)
    redirect_to product_path(@product)
  end

  def new
  end

  def index
  end

  def destroy
    @product = Product.find(params[:product_id])
    @variant = @product.variants.find(params[:id])
    @variant.destroy
    redirect_to product_path(@product)
  end

  private
    def variant_params
      params.require(:variant).permit!
    end

end
