class Course < ApplicationRecord
  validates :title,  presence: true
  validates :description, presence: true, length: { :minimum => 5 }
  
  extend FriendlyId
  friendly_id :title, use: :slugged
  
  belongs_to :user
  
  def to_s
    title
  end
  
  has_rich_text :description
end
