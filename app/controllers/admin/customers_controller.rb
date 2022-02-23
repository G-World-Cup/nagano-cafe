class Admin::CustomersController < ApplicationController
  before_action :set_customer, only: [:show, :edit, :update]
  before_action :authenticate_admin!

  def index
    @customers = Customer.all
  end

  def show
  end

  def edit
  end

  def update
    @customer.update(customer_params)
    redirect_to admin_customer_path(@customer.id)
  end

  private
  def set_customer
    @customer = Customer.find(params[:id])
  end

  def customer_params
  	params.require(:customer).permit(:is_deleted, :last_name, :first_name, :last_name_kana, :first_name_kana,
  	                                   :phone_number, :email, :password, :postcode, :address)
  end

end
