class Course < ActiveRecord::Base
  paginates_per 20
  belongs_to :source
  validates :title, presence: true
  validates :url, presence: true
  validates :source, presence: true

  def self.search(search)
    if search.present?
      where("title ilike :q or description ilike :q", q: "%#{search}%")
    else
      self.all
    end
  end
end
