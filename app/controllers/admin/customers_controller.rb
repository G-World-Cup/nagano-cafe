class Admin::CustomersController < ApplicationController
  before_action :set_customer, only: [:show]

  def index
    @customers = Customer.all
  end

  def show
    @customer = Customer.find(params[:id])
  end

  private
  def set_customer
    @customer = Customer.find(params[:id])
  end
end
