class Fighter < ApplicationRecord
  validates :name, :description, presence: true
end
