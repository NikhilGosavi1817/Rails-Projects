class Project < ApplicationRecord
  belongs_to :user
  has_many :tenders
  include AASM

  aasm column: 'status' do
    state :pending, initial: true
    state :finished
  end
end
