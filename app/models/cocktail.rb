class Cocktail < ApplicationRecord
  has_attachment :photo
  has_many :ingredients, :through => :doses
  has_many :doses, inverse_of: :cocktail, dependent: :destroy
  accepts_nested_attributes_for :doses, reject_if: :all_blank, allow_destroy: true

  validates :name, presence: true, uniqueness: true

end
