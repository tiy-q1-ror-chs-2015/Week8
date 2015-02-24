require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do
  it 'should return the active link' do
    params[:controller] = 'fred_flintstone'
    expect(helper.active_link("fred_flintstone")).to eq(:active)
  end

  it 'should return the active link' do
    params[:controller] = 'patients'
    expect(helper.active_link("fred_flintstone")).to eq(nil)
  end

  it 'should return the active link' do
    params[:controller] = 'patients'
    expect(helper.active_link("fred_flintstone")).not_to eq(:active)
  end

end

  # def active_link(current_link)
  #   # puts params.inspect
  #   # params[:controller] == link_controller ? 'active' : ''
  #   :active if params[:controller] == current_link
  # end
