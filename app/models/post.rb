class Post < ApplicationRecord
  validates_presence_of :date, :reason
end
