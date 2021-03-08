class Course < ApplicationRecord
  belongs_to :user
  validates :title, :language, :price, :level, :short_description,  presence: true
  validates :description, presence: true, length: { :minimum => 5 }
  
  extend FriendlyId
  friendly_id :title, use: :slugged
  
  
  def to_s
    title
  end
  
  has_rich_text :description
end
