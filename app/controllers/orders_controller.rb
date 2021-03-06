# frozen_string_literal: true

# Order controller with needed actions
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

    if @order.save
      flash[:success] = 'Order was successfully created.'
      redirect_to :orders
    else
      flash[:danger] = "Order could not be created. #{stringfy_errors(@order)}"
      render :new
    end
  end

  def update
    @order = Order.find(params[:id])

    return unless @order

    if @order.increment_state
      flash[:success] = 'Order state updated!'
      redirect_back(fallback_location: root_path)
    else
      flash[:danger] = 'Order state could not be updated'
      redirect_to :orders
    end
  end

  private

  def set_order
    @order = Order.find(params[:id])
  end

  def order_params
    params.require(:order).permit(:control_number, :status)
  end

  def stringfy_errors(order)
    str = ["#{order.errors.count > 1 ? 'Errors' : 'Error'}:"]
    order.errors.full_messages.each_with_index do |message, i|
      str += ["#{i.zero? ? '' : ','} #{message}"]
    end

    str.join(' ')
  end
end
