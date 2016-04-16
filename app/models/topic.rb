class Topic < ActiveRecord::Base
  has_many :posts

  validates :title, length: { minimum: 5 }, presence: true
  validates :body, length: { minimum: 15 }, presence: true
end
