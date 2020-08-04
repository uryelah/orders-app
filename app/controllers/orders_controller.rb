# frozen_string_literal: true

class OrdersController < ApplicationController
  before_action :set_order, only: %i[show edit update destroy]

  def index
    @orders = if params['order_control']
                Order.control_number(params['order_control'])
              else
                Order.list(params['filter_param'])
              end
  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)

    respond_to do |format|
      if @order.save
        format.html { redirect_to :orders, notice: 'Order was successfully created.' }
        format.json { render :index, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @order = Order.find(params[:id])

    if @order
      if @order.increment_state
        flash[:notice] = 'Order state updated!'
        redirect_to :orders
      else
        flash[:error] = 'Order state could not be updated'
        redirect_to :orders
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_order
    @order = Order.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def order_params
    params.require(:order).permit(:control_number, :status)
  end
end
