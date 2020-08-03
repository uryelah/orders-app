require 'rails_helper'

RSpec.describe Order, type: :model do
  it 'is valid with valid attributes' do
    order = Order.new(control_number: 10)
    expect(order).to be_valid
  end

  it 'is valid with no attributes' do
    order = Order.new
    expect(order).to be_valid
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
    order = Order.new(control_number: 10)
    expect(order).to_not be_valid
  end

  it 'assigns 0 as the state value before validation' do
    order = Order.new(control_number: 10)
    order.valid?
    expect(order.state).to be(0)
  end

  it 'assigns it\'s id as control_number if no control_number is given' do
    order = Order.create
    expect(order.control_number).to be(order.id)
  end
end
