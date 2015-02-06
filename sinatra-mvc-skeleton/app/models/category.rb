class Category < ActiveRecord::Base
  # Remember to create a migration!
  belong_to :alignment
  has_many :activities
end
