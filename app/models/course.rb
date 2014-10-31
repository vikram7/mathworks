class Course < ActiveRecord::Base
  belongs_to :source
  validates :title, presence: true
  validates :url, presence: true, uniqueness: true
  validates :source, presence: true
end
