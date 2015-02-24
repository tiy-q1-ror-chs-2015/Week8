require 'rails_helper'

RSpec.describe WelcomeHelper, type: :helper do
  it 'should return magic gifs' do
    # shia_magic
    expect(helper.shia_magic).to eq("<div class=\"col-md-4\"><img src=\"/assets/magic.gif\" alt=\"Magic\" /><img class=\"img-circle\" src=\"/assets/magic.gif\" alt=\"Magic\" /><img src=\"/assets/funny_images/sup_foo.jpg\" alt=\"Sup foo\" /></div>")
  end
end