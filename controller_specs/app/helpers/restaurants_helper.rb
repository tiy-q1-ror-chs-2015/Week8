module RestaurantsHelper
  def is_restaurant_open?(restaurant_object)
    restaurant_object.current_state
  end
end
