class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable
         
  rolify
  
  has_many :courses
  has_many :enrollments
  
  def to_s
    email
  end
  
  
  extend FriendlyId
  friendly_id :email, use: :slugged
  
  after_create :assign_default_role

  def assign_default_role
    if User.count == 1
      self.add_role(:admin) if self.roles.blank?
      self.add_role(:teacher)
      self.add_role(:student)
    else
      self.add_role(:student) if self.roles.blank?
      self.add_role(:teacher)
    end
  end
  
  validate :must_have_role, on: :update
  
  def online?
    updated_at > 2.minute.ago
  end
  
  private
  
  def must_have_role
    unless roles.any?
      errors.add(:roles, "must have a role")
    end
  end
  
end
