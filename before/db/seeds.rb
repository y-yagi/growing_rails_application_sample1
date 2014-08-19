50.times do |_|
  a = Account.create!(
    name: Faker::Name.name, email: Faker::Internet.email, credits: (100..10000).to_a.sample
  )
  Subscription.create!(account: a)
end
