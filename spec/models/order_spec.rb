# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Order, type: :model do
  let(:order_10) { Order.new(control_number: 10) }

  it 'is valid with no attributes' do
    order = Order.new
    expect(order).to be_valid
  end

  it 'is valid with valid attributes' do
    expect(order_10).to be_valid
  end

  it 'is valid without a control_number' do
    order = Order.new(control_number: nil)
    expect(order).to be_valid
  end

  it 'is not valid with a non integer control_number' do
    order = Order.new(control_number: 'control')
    expect(order).to_not be_valid
  end

  it 'is not valid when control_number is not unique' do
    Order.create(control_number: 10)
    expect(order_10).to_not be_valid
  end

  it 'assigns 0 as the state value before validation' do
    order_10.valid?
    expect(order_10.state).to be(0)
  end

  it 'assigns it\'s id as control_number if no control_number is given' do
    order = Order.create
    expect(order.control_number).to be(order.id)
  end

  describe 'increment_state' do
    first_order = Order.create

    it 'Updates the state value from 0 to 1 when an order state is 0' do
      first_order.increment_state
      expect(first_order.state).to be(1)
    end

    it 'Updates the state value from 1 to 2 when an order state is 2' do
      first_order.increment_state
      expect(first_order.state).to be(2)
    end

    it 'Dos not update the state value when an order state is 2' do
      first_order.increment_state
      expect(first_order.state).to be(2)
    end
  end
end
