class Benficary < ApplicationRecord
  belongs_to :user
  has_many :transfers
end
