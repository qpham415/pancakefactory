class CustomersController < ApplicationController
  around_filter :shopify_session, :except => 'welcome'

  def welcome
    current_host = "#{request.host}#{':' + request.port.to_s if request.port != 80}"
    @callback_url = "http://#{current_host}/login"
  end

  def index
    @customers = Customer.all

    @shopify_customers = ShopifyAPI::Customer.find(:all)
  end

  def show
    @customer = Customer.find(params[:id])

    Customer.import
  end

  def new
  end

  def create
    @customer = Customer.new(customer_params)

    @customer.save
    redirect_to @customer
  end

  def destroy
    @customer = Customer.find(params[:id])
    @customer.destroy

    redirect_to customers_path
  end

  private
    def customer_params
      params.require(:customer).permit!
    end

end
