class Public::AddressesController < ApplicationController
  before_action :authenticate_customer!
  before_action :set_address, only: [:edit, :update, :destroy]

  def index
    @addresses = Address.all
    @address = Address.new
  end

  def create
    @address = Address.new(address_params)
    @address.customer_id = current_customer.id
    if @address.save
      redirect_to addresses_path
    else
      @address = Address.all
      render 'index'
    end
  end

  def edit
  end

  def update
    @address.update(address_params)
    redirect_to addresses_path
  end

  def destroy
    @address.destroy
    redirect_to addresses_path
  end

  private

  def set_address
    @address = Address.find(params[:id])
  end

  def address_params
    params.require(:address).permit(:customer_postcode, :customer_address, :customer_name, :customer_id)
  end
end
