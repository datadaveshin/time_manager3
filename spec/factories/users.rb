FactoryBot.define do
  factory :user do
    first_name {"John"}
    last_name {"Doe"}
    email {"test@example.com"}
    password {"12345678"}
    password_confirmation {"12345678"}
  end

  factory :admin_user, class: "AdminUser" do
    first_name {"Jane"}
    last_name {"Doyle"}
    email {"jane@example.com"}
    password {"asdfjkl;"}
    password_confirmation {"asdfjkl;"}
  end
end
