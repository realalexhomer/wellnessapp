class Category < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :alignment
  has_many :activities
end
