# encoding: UTF-8
Program.delete_all
# . . .
Program.create(id: 1,
  program_name_hu: '24 órás meditáció',
  program_name_en: '24 hour meditation',
  price_full: 0,
  price_full_eur: 0,
  price_discount_eur: 0,
  price_discount: 0,
  exchange_rate: 300,
  event_date: DateTime.strptime("2014-07-22 15:00+02:00", '%Y-%m-%d %H:%M%z')
  )
# . . .
Program.create(id: 2,
  program_name_hu: 'Első nap',
  program_name_en: 'First day',
  price_full: 4000,
  price_full_eur: 14,
  price_discount_eur: 10,
  price_discount: 3000,
  exchange_rate: 300,
  event_date: DateTime.strptime("2014-07-23 15:00+02:00", '%Y-%m-%d %H:%M%z')
  )
# . . .
Program.create(id: 3,
  program_name_hu: 'Második nap',
  program_name_en: 'Second day',
  price_full: 4000,
  price_full_eur: 14,
  price_discount_eur: 10,
  price_discount: 3000,
  exchange_rate: 300,
  event_date: DateTime.strptime("2014-07-24 15:00+02:00", '%Y-%m-%d %H:%M%z')
  )
# . . .
Program.create(id: 4,
program_name_hu: 'Harmadik nap',
  program_name_en: 'Third day',
  price_full: 4000,
  price_full_eur: 14,
  price_discount_eur: 10,
  price_discount: 3000,
  exchange_rate: 300,
  event_date: DateTime.strptime("2014-07-25 15:00+02:00", '%Y-%m-%d %H:%M%z')
  )
# . . .
Program.create(id: 5,
  program_name_hu: 'Negyedik nap',
  program_name_en: 'Fourth day',
  price_full: 4000,
  price_full_eur: 14,
  price_discount_eur: 10,
  price_discount: 3000,
  exchange_rate: 300,
  event_date: DateTime.strptime("2014-07-26 15:00+02:00", '%Y-%m-%d %H:%M%z')
  )
# . . .
Program.create(id: 6,
  program_name_hu: 'Ötödik nap',
  program_name_en: 'Fifth day',
  price_full: 4000,
  price_full_eur: 14,
  price_discount_eur: 10,
  price_discount: 3000,
  exchange_rate: 300,
  event_date: DateTime.strptime("2014-07-27 20:00+02:00", '%Y-%m-%d %H:%M%z')
  )