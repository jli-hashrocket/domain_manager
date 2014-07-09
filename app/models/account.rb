class Account < ActiveRecord::Base
  validates_presence_of :name
  validates_uniqueness_of :name

  has_many :domains,
    inverse_of: :account
end
