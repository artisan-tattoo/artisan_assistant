# Remember, seeds.rb should be idempotent!!! Lots of `.first_or_create` here.
#
# I leave this note because I originally made the DateTimes be DateTime.now,
# which isn't idempotent!

shop = Shop.where(
  name: "Artisan Tattoo",
  email: "artisan@example.com",
).first_or_create

shop.password = "password"
shop.password_confirmation = "password"
shop.save

artist = Artist.where(
  name: "Jason Angst",
  shop: shop,
).first_or_create

artist.password = "password"
artist.password_confirmation = "password"
artist.save

customer = Customer.where(
  name: "Jane Doe",
  phone: "555 555 5555",
  email: "jane@example.com",
  date_on_waiting_list: DateTime.civil(2014, 1, 10, 0, 0, 0, 0),
  status: 2, # waiting
  local: true,
  location: "Pittsburgh, PA",
  credit: "$10",
  want: "Super awesome dragon backpiece.",
  notes: "",
  artist: artist
).first_or_create

appointment = Appointment.where(
  date_scheduled: DateTime.civil(2014, 1, 1, 0, 0, 0, 0),
  description: "Just the outline of the dragon.",
  customer: customer,
  artist: artist,
).first_or_create

appointment = Appointment.where(
  date_scheduled: DateTime.civil(2014, 1, 20, 0, 0, 0, 0),
  description: "Blacklining and gray shading",
  customer: customer,
  artist: artist,
).first_or_create
