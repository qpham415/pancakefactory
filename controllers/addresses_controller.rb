class AddressesController < ApplicationController
  around_filter :shopify_session, :except => 'welcome'

  def welcome
    current_host = "#{request.host}#{':' + request.port.to_s if request.port != 80}"
    @callback_url = "http://#{current_host}/login"
  end

  def create
    @customer = Customer.find(params[:customer_id])
    @address = @customer.addresses.create(address_params)
    redirect_to customer_path(@customer)
  end

  def new
  end

  def index
  end

  def destroy
    @customer = Customer.find(params[:customer_id])
    @address = @customer.addresses.find(params[:id])
    @address.destroy
    redirect_to customer_path(@customer)
  end

  private
    def address_params
      params.require(:address).permit!
    end
end
