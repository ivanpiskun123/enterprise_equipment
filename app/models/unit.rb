class Unit < ApplicationRecord
  belongs_to :nomination
  belongs_to :user
  has_one :breakdown_cause
  has_one :bid

  # units without user_id = office equipment

  validates_associated :user, :nomination
  validates_presence_of :user, :nomination

  validates :cost, :product_url, presence: true

  validates :cost, inclusion: { in: 0..99999999999 ,
            message: "(%{value}) can't be less 0 and more 99999999999" }


end
