class Course < ApplicationRecord
  belongs_to :user
  has_many :lessons, dependent: :destroy
  has_many :enrollments
  
  validates :title, :language, :price, :level, :short_description,  presence: true
  validates :description, presence: true, length: { :minimum => 5 }
  
  extend FriendlyId
  friendly_id :title, use: :slugged
  
  def to_s
    title
  end
  
  has_rich_text :description
  
  include PublicActivity::Model
  tracked owner: Proc.new{ |controller, model| controller.current_user }
  
  #check if current user has already enrolled to the course
  def bought(user)
    self.enrollments.where(user_id[:user.id], course_id: [self.id].empty?)  
  end
end
