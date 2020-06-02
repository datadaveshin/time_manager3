FactoryBot.define do
  sequence :email do |n|
    "test#{n}@example.com"
  end

  factory :user do
    first_name {"John"}
    last_name {"Doe"}
    email { generate :email }
    password {"12345678"}
    password_confirmation {"12345678"}
  end

  # factory :second_user do
  #   first_name {"James"}
  #   last_name {"Doe"}
  #   email {"james@example.com"}
  #   password {"12345678"}
  #   password_confirmation {"12345678"}
  # end

  factory :admin_user, class: "AdminUser" do
    first_name {"Jane"}
    last_name {"Doyle"}
    email { generate :email }
    password {"asdfjkl;"}
    password_confirmation {"asdfjkl;"}
  end
end
