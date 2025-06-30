class Post < ApplicationRecord
  belongs_to :user

  validates :title, presence: true, length: { minimum: 3, maximum: 300 }
  validates :content, presence: true, length: { minimum: 3, maximum: 40000 }
end
