# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
recipients = (1..5).map do
  r = Recipient.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    phone_number: Faker::PhoneNumber.cell_phone_with_country_code,
    story: Faker::Lorem.paragraph
  )
  r.cover_photo.attach(io: File.open('/Users/carl/king.jpg'), filename: 'image.png')
  r
end
donors = (1..3).map do
  Donor.create(
    email: Faker::Internet.email,
    phone_number: Faker::PhoneNumber.cell_phone_with_country_code,
  )
end
pledges = (1..4).map do
  Pledge.create(
    donor: donors.sample,
    recipient: recipients.sample,
    weekly_amount_in_rands: Pledge::DEFAULT_PLEDGE_AMOUNT
  )
end
vouchers = (1..5).map do
  Voucher.create(
    recipient: recipients.sample,
    amount_in_rands: Pledge::DEFAULT_PLEDGE_AMOUNT,
    state: Voucher::STATES.sample
  )
end