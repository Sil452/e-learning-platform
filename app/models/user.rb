class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable
         
  rolify
  
  def to_s
    email
  end
  
  has_many :courses
  
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
  
  private
  
  def must_have_role
    unless roles.any?
      errors.add(:roles, "must have a role")
    end
  end
  
end
