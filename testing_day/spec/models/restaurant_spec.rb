require 'rails_helper'

RSpec.describe Restaurant, type: :model do
  subject do
    Restaurant.new({
      name: "Some Restaurant",
      description: "We serve awesome food",
      address: "510 Mill Street",
      city: "Mount Pleasant",
      state: "SC",
      zip: "29464"
    })
  end

  let(:comment) do
    Comment.new({
      content: "Hi"
    })
  end

  it "should have a name" do
    restaurant = Restaurant.new
    restaurant.name = "Robbi's Awesome Restaurant"
    expect(restaurant.name).to eq("Robbi's Awesome Restaurant")
  end

  it "should NOT have a name" do
    restaurant = Restaurant.new
    expect(restaurant.name).not_to eq("Robbi's Awesome Restaurant")
  end

  it "should NOT have a name" do
    restaurant = Restaurant.new
    restaurant.name = "Robbi's Awesome Restaurant"
    expect(restaurant.name).not_to eq(nil)
  end

  it "should have a description" do
    restaurant = Restaurant.new({
      name: "Adam's Burgers",
      description: "We only serve Kobe beef."
    })
    expect(restaurant.name).to eq("Adam's Burgers")
    expect(restaurant.description).to eq("We only serve Kobe beef.")
  end

  it "should have an address" do
    expect(subject.address).to eq("510 Mill Street")
    expect(subject.city).to eq("Mount Pleasant")
    expect(subject.state).to eq("SC")
    expect(subject.zip).to eq("29464")
  end

  it "should have an address" do
    expect(subject.address).not_to eq(nil)
    expect(subject.city).not_to eq(nil)
    expect(subject.state).not_to eq(nil)
    expect(subject.zip).not_to eq(nil)
  end

  it "sould validate when we do not have a name" do
    no_name = Restaurant.new
    expect(no_name.valid?).to eq(false)
    expect(no_name.errors).to include(:name)
    expect(no_name.errors.full_messages).to include("Name can't be blank")
  end

  it "should validate when we create" do
    no_name = Restaurant.new
    expect(no_name.errors).not_to include(:name)
    no_name.save
    expect(no_name.errors).to include(:name)
    expect(no_name.errors.full_messages).to include("Name can't be blank")    
  end

  it "should start in the state of under_construction" do
    expect(subject.current_state).to eq("under_construction")
  end

  it "should be able to transfer to 5 states from under_construction" do
    expect(subject.current_state.events.keys).to eq([
      :construct,
      :open,
      :close,
      :condemn,
      :grand_opening
    ])
  end

  it "should be able to transfer to 3 states from opened" do
    subject.save
    subject.open!
    expect(subject.current_state.events.keys).to eq([
      :open,
      :close,
      :condemn
    ])
  end

  it "should have comments by default" do
    subject.comments << comment
    expect(subject.comments.length).to eq(1)
  end

end

# t.string   "name",           limit: 255
# t.text     "description",    limit: 65535
# t.string   "address",        limit: 255
# t.string   "city",           limit: 255
# t.string   "state",          limit: 255
# t.string   "zip",            limit: 255