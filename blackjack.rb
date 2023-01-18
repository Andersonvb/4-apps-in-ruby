class Card
  attr_reader :suit, :value

  def initialize(suit, value)
    @suit = suit
    @value = value
  end

  def value
    return 10 if ["J", "Q", "K"].include?(@value)
    return 11 if @value == "A"
    return @value
  end

  def to_s
    "#{@value}-#{suit}"
  end
end

class Deck
  attr_reader :cards

  def initialize
    @cards = []
    build_cards
  end

  def take!
    @cards.shift
  end

  private
    def build_cards
      [:clubs, :diamonds, :spades, :hearts].each do |suit|
        (2..10).each { |i| @cards << Card.new(suit, i) }
        ["J", "Q", "K", "A"].each { |i| @cards << Card.new(suit, i) }
      end
      @cards.shuffle!
    end
end

class Hand
  attr_reader :cards

  def initialize(deck)
    @deck = deck
    @cards = []
  end

  def hit!
    @cards << @deck.take!
  end

  def value
    @cards.map { |card| card.value }.reduce { |a, e| a + e }
  end

  def to_s
    str = ""
    @cards.each { |card| str += "#{card} " } 
    str + "(#{self.value == 21 ? "BJ" : self.value})"
  end
end

deck = Deck.new
dealer = Hand.new(deck)
player = Hand.new(deck)

player.hit!
player.hit!
dealer.hit!

puts "Repartidor: #{dealer}"
puts "Jugador:    #{player}\n\n"

puts "Tu turno: "
while player.value < 21

print "  ¿Carta(C) o plantas(P)? "
option = gets.chomp

  if option == "c" || option == "C"
    player.hit!
    puts "  #{player}"
  elsif option == "p" || option == "P"
    break
  else
    puts "El comando es válido"
  end
end

if player.value <= 21
  puts
  puts "Turno del repartidor"
  dealer.hit!
  puts "  #{dealer}"
  while dealer.value < 17
    dealer.hit!
    puts "  #{dealer}"
  end
end

puts
puts "Repartidor: #{dealer.value}"
puts "Jugador: #{player.value}\n\n"

if player.value > 21
  puts "Perdiste :("
elsif dealer.value > 21
  puts "Ganaste"
elsif player.value == dealer.value
  puts "Empate"
elsif dealer.value > player.value 
  puts "Perdiste"
else
  puts "Ganaste"
end
