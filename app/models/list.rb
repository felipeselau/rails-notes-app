class List < ApplicationRecord
  has_many :notes
  has_many :tasks
end
