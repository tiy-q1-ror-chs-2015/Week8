FactoryGirl.define do
  factory :user do
    email "dude@sup.com"
    password  "password"
    password_confirmation "password"
  end

  # # This will use the User class (Admin would have been guessed)
  # factory :admin, class: User do
  #   first_name "Admin"
  #   last_name  "User"
  #   admin      true
  # end

  # factory :food do
  #   restaurant FactoryGirl.create(:restaurant)
  # end

  factory :restaurant do
    name "Some Restaurant"
    description "We serve awesome food"
    address "510 Mill Street"
    city "Mount Pleasant"
    state "SC"
    zip "29464"
  end

end