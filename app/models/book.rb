class Book < ApplicationRecord
	has_many :page, dependent: :destroy
	validates :title, presence: true
end
