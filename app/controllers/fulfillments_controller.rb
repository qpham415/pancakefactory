class FulfillmentsController < ApplicationController
  around_filter :shopify_session, :except => 'welcome'

  def welcome
    current_host = "#{request.host}#{':' + request.port.to_s if request.port != 80}"
    @callback_url = "http://#{current_host}/login"
  end

  def create
    @order = Order.find(params[:order_id])
    @fulfillment = @order.fulfillments.create(fulfillment_params)
    redirect_to order_path(@order)
  end

  def new
  end

  def index
  end

  def destroy
    @order = Order.find(params[:order_id])
    @fulfillment = @order.fulfillments.find(params[:id])
    @fulfillment.destroy
    redirect_to order_path(@order)
  end

  private
    def fulfillment_params
      params.require(:fulfillment).permit!
    end
end
