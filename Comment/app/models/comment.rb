class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :book
  belongs_to :parent, class_name: 'Comment', optional: true
  has_many :comments, class_name: 'Comment', foreign_key: :parent_id
end
