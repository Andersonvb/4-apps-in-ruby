require 'eu_central_bank'
eu_bank = EuCentralBank.new
Money.default_bank = eu_bank
Money.locale_backend = :currency
Money.default_currency="USD"
Money.rounding_mode=:up

eu_bank.update_rates

puts "\n¡Bienvenidos a ConveMoney! La forma más fácil de convertir dinero a diferentes monedas. \n\n"
puts "Ejemplos:"
puts "  100 USD a EUR"
puts "  2000 USD a BRL"

exit = false

until exit
  print "\n> "
  options = gets.chomp.split(/\s/)
  break if options.include?("exit")
  puts "#{options[1].upcase} a #{options[3].upcase}: #{eu_bank.exchange(options[0], options[1].upcase, options[3].upcase)}"
end