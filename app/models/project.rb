class Project < ApplicationRecord
	has_many :todos, dependent: :destroy
	validates :title, presence: true, uniqueness: true
	validates_associated :todos
end
