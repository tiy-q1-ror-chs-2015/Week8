require 'rails_helper'

describe RestaurantsController do
  let(:restaurant) { 
    Restaurant.create({name: "Hi", description: "this is a cool restaurant."})
  }

  # describe 'GET YADDA YADDA' do
  #   it 'asdf' do
  #     get :index
  #     p Restaurant.all
  #   end
  # end

  describe 'GET #show' do
    it 'should show a restaurant object' do
      get :show, id: restaurant#, format: :json
      # expect(assigns(Restaurant).)
      expect(assigns(:restaurant)).to eq restaurant
      expect(assigns(:foods).length).to eq(0)
      expect(assigns(:foods)).to eq([])
      expect(assigns(:foods).class).to eq(Food::ActiveRecord_Associations_CollectionProxy)
      expect(assigns(:comment).new_record?).to eq(true)
      expect(assigns(:comment).class).to eq(Comment)
    end    
  end

  describe 'GET #new' do
    it 'should initialize a new restaurant' do
      get :new
      expect(assigns(:restaurant).class).to eq Restaurant
      expect(assigns(:restaurant).new_record?).to eq(true)
      expect(assigns(:foods).class).to eq(Food::ActiveRecord_Relation)
      expect(assigns(:foods)).to eq([])
    end
  end

  describe 'POST #create_comment' do
    it 'should create a commment' do
      post :create_comment, id: restaurant, comment: { content: "Hello World" }
      expect(assigns(:restaurant)).to eq restaurant
      expect(assigns(:comment).class).to eq Comment
      expect(assigns(:comment).commentable_id).to eq restaurant.id
      expect(assigns(:comment).commentable_type).to eq "Restaurant"
      # expect(assigns(:comments)).to eq []
      expect(response).to redirect_to restaurant_path(restaurant)
    end
  end

  describe 'GET #index' do
    let!(:restaurant1) {
      Restaurant.create({name: "Hi", description: "this is a cool restaurant."})
    }

    let!(:restaurant2) {
      Restaurant.create({name: "Hello", description: "this is a cool restaurant."})
    }

    let!(:restaurant3) {
      Restaurant.create({name: "Howdy", description: "this is a cool restaurant."})
    }

    it 'should not return any restaurants' do
      get :index, q: 'asdf'
      expect(assigns(:restaurants)).not_to eq(nil)
      expect(assigns(:restaurants)).to eq([])
    end

    it 'should return only 1 restaurant' do
      get :index, q: 'Howdy'
      expect(assigns(:restaurants)).not_to eq(nil)
      expect(assigns(:restaurants)).to eq([restaurant3])
    end 

    it 'should return all 3 restaurants' do
      get :index, q: 'H'
      expect(assigns(:restaurants)).not_to eq(nil)
      expect(assigns(:restaurants).length).to eq(3)
      expect(assigns(:restaurants)).to include(restaurant1)
      expect(assigns(:restaurants)).to include(restaurant2)
      expect(assigns(:restaurants)).to include(restaurant3)
    end
   
    it 'should return all restaurants' do
      get :index
      expect(assigns(:restaurants)).not_to eq(nil)
      expect(assigns(:restaurants).length).to eq(3)
      expect(assigns(:restaurants)).to include(restaurant1)
      expect(assigns(:restaurants)).to include(restaurant2)
      expect(assigns(:restaurants)).to include(restaurant3)
    end    

    it 'should return all restaurants' do
      get :index, q: ""
      expect(assigns(:restaurants)).not_to eq(nil)
      expect(assigns(:restaurants).length).to eq(3)
      expect(assigns(:restaurants)).to include(restaurant1)
      expect(assigns(:restaurants)).to include(restaurant2)
      expect(assigns(:restaurants)).to include(restaurant3)
    end
  end
end


