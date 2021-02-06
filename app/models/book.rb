class Book < ApplicationRecord

  validates :title, presense: true
  validates :body, presense: true, length:{ maximum: 200 }
  belongs_to :user

end
