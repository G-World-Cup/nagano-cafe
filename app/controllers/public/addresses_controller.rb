class Public::AddressesController < ApplicationController
  before_action :set_address, only: [:edit, :update, :destroy]

  def index
    @addresses = Address.all
  end

  def create
    @address = Address.new(address_params)
    @address.customer_id = current_customer.id
    @address.save
    redirect_to addresses_path
  end

  def edit
  end

  def update
    @address.update(address_params)
    redirect_to addresses_path
  end

  def destroy
  end

  private

  def set_address
    @address = Address.find(params[:id])
  end

  def address_params
    params[:address].permit(:name, :postal_code, :shipping_address, :customer_id, :id)
  end
end
