class Tender < ApplicationRecord
  belongs_to :project

  include AASM

  aasm column: 'status' do
    state :open, initial: true
    state :rejected
    state :closed
    state :selected

    event :select do
      transitions from: :open, to: :selected
    end
  end
end
