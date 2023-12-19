class Public::CustomersController < ApplicationController
 before_action :authenticate_customer!


  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = current_customer
    if @customer.update(customer_params)
       redirect_to customers_show_path
    else
       render 'edit'
    end
  end

  def withdraw
    @customer = current_customer
    if @customer.update(is_active: false)
      sign_out(@customer)
       redirect_to root_path
    end
  end

  private

  def customer_params
    params.require(:customer).permit(:last_name,
                                     :first_name,
                                     :birthday,
                                     :address,
                                     :telephone_number,
                                     :email
                                     )
  end


end
