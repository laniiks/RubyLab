class LabReport < ApplicationRecord
    has_many :marks, dependent: :destroy
    validates :title, presence: true, length: {minimum: 5}
end
