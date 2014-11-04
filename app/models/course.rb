class Course < ActiveRecord::Base
  paginates_per 20
  belongs_to :source
  validates :title, presence: true
  validates :url, presence: true
  validates :image_url, format: { with: /\.(png|jpg|gif)/, message: "Image URL must end in .png, .jpg or .gif format"}
  validates :source, presence: true

  def self.search(search)
    if search.present?
      joins(:source).where("title ilike :q or description ilike :q or sources.name ilike :q", q: "%#{search}%")
    else
      self.all
    end
  end
end
