class Quote < ApplicationRecord
  validates :author, :presence => true
  validates :content, :presence => true

  def self.search(x)
    where("author ILIKE ? OR content ILIKE ?", "%#{x}%", "%#{x}%")
  end

  # scope :search, -> (name) { where("name like ?", "%#{name}") }

end
