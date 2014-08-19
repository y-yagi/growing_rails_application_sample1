class Subscription < ActiveRecord::Base
  belongs_to :account
  enum type: [ :news, :it, :culture, :other ]
end
