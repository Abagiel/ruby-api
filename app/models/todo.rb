class Todo < ApplicationRecord
	belongs_to :project
	validates :project_id, presence: true, numericality: {only_integer: true}
	validates :text, presence: true
	validates :isCompleted, inclusion: [true, false]
end
