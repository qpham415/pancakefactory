class OrdersController < ApplicationController
  around_filter :shopify_session, :except => 'welcome'

  def welcome
    current_host = "#{request.host}#{':' + request.port.to_s if request.port != 80}"
    @callback_url = "http://#{current_host}/login"
  end

  def index
    @orders = Order.all

    @shopify_orders = ShopifyAPI::Order.find(:all)
  end

  def show
    @order = Order.find(params[:id])
  end

  def new
  end

  def create
    @order = Customer.new(customer_params)
    @order.save

    redirect_to @order
  end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy

    redirect_to orders_path
  end

  private
    def order_params
      params.require(:customer).permit!
    end
end
