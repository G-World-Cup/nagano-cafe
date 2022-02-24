class Public::CustomersController < ApplicationController
  before_action :set_customer, only: [:show, :edit, :update, :withdraw, :switch]
  before_action :authenticate_customer!
  before_action :ensure_correct_customer

  def show
  end

  def edit
  end

  def update
    if @customer.update(customer_params)
      flash[:success] = "You have edited user data successfully."
      redirect_to customer_path(@customer)
    else
      render 'edit'
    end
  end

  def withdraw #退会画面を表示するアクション
  end

  def switch
    if @customer.update(is_deleted: true)
     sign_out current_customer #URLを踏ませずにコントローラーから直接サインアウトの指示を出す（device公式)
    end
    redirect_to root_path
  end


  private

  def customer_params
  	  params.require(:customer).permit(:is_deleted, :last_name, :first_name, :last_name_kana, :first_name_kana,
  	                                   :phone_number, :email, :password, :postcode, :address)
  end

  def set_customer
    @customer = Customer.find(params[:id])
  end

  def ensure_correct_customer
    @customer = Customer.find(params[:id])
    unless @customer == current_customer
      redirect_to root_path(current_customer)
    end
  end
end
