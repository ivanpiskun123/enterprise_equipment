class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_one_attached :avatar

  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable

  devise :database_authenticatable,
          :validatable, :trackable

  after_initialize :init

  belongs_to :position
  has_many :units
  has_many :bids
  has_many :breakdown_causes

  validates_associated :position
  validates_presence_of :position

  validates :email, uniqueness: true
  validates :first_name, :second_name, :email, :male, presence: true

  validates :work_experience, inclusion: { in: 0..99999999999 ,
            message: "(%{value}) can't be less 0 and more 99999999999" }

  def init
      self.is_admin = false if self.is_admin.nil?
  end


end
