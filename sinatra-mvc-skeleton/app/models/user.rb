# TODO: validations
#   ~ ash.
class User < ActiveRecord::Base
  has_secure_password
  # Remember to create a migration!
  has_many :activities
end
