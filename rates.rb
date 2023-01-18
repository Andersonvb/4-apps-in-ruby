require 'eu_central_bank'
eu_bank = EuCentralBank.new
Money.default_bank = eu_bank
Money.locale_backend = :currency
Money.default_currency="USD"
Money.rounding_mode=:up

eu_bank.update_rates

puts "\nLas tasas hoy son: "
puts "  Dollar a Euro: #{Money.us_dollar(100).exchange_to("EUR")}"