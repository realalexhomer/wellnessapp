class Alignment < ActiveRecord::Base
  # Remember to create a migration!
  has_many :categories
  has_many :activities through: :categories

  validates :name, uniqueness: {case_senstitive: false}

end
