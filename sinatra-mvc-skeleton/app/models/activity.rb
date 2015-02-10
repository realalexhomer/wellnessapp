# TODO: validations
#   ~ ash.
class Activity < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :user
  belongs_to :category
end
