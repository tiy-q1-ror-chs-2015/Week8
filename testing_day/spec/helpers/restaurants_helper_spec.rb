require 'rails_helper'

RSpec.describe RestaurantsHelper, type: :helper do
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

  it 'should return whether a restaurant is open or not' do
    expect(helper.is_restaurant_open?(subject)).to eq("under_construction")
  end
end