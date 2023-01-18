puts "Indice de masa corporal (IMC)\n\n"

print "Ingrese su peso (kg): "
weight = gets.chomp.to_f
print "\nIngrese su estatura (metros): "
height = gets.chomp.to_f

bmi = weight / height**2

puts "Tu IMC es: #{bmi.round(2)}"
if bmi < 18.5
  puts "Tu peso es bajo"
elsif bmi < 25
  puts "Tu peso es normal"
else
  puts "Tu peso es alto"
end