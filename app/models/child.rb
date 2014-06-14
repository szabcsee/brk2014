class Child < ActiveRecord::Base
  belongs_to :user
  validate :age, :child_care, :language, :name, :presence => true
end
