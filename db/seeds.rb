# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
recipients = (1..50).map do
  Recipient.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    phone_number: Faker::PhoneNumber.cell_phone_with_country_code,
    story: Faker::Lorem.paragraph
  )
end
donors = (1..20).map do
  Donor.create(
    email: Faker::Internet.email,
    phone_number: Faker::PhoneNumber.cell_phone_with_country_code,
  )
end
pledges = (1..20).map do
  Pledge.create(
    donor: donors.sample,
    recipient: recipients.sample,
    weekly_amount_in_rands: 200
  )
end
vouchers = (1..50).map do
  Voucher.create(
    recipient: recipients.sample,
    amount_in_rands: 200,
    state: Voucher::STATES.sample
  )
end