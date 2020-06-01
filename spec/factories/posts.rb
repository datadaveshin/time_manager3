FactoryBot.define do
  factory :post do
    date {Date.today}
    reason {"First reason"}
  end

  factory :second_post, class: "Post" do
    date {Date.yesterday}
    reason {"Second reason"}
  end
end
