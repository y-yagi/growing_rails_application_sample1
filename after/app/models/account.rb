class Account < ActiveRecord::Base
  has_many :subscriptions
end
