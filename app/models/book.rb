class Book < ApplicationRecord
	belongs_to :user

	validates :title, presence: true
	validates :title,    length: { maximum: 199 }
	validates :opinion, presence: true
	validates :opinion,    length: { maximum: 199 }
end
