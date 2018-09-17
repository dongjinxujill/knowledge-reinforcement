class Card
  attr_reader :value, :revealed
  # attr_writer :revealed

  VALUES = ("A".."Z").to_a

  def self.shuffled_cards(size)
    values = VALUES
    while size > values.length
      values += values
    end

    values = values.shuffle.take(size) * 2
    values.shuffle!
    values.map {|val| self.new(val)}
  end


  def initialize(value, revealed = false)
    @value = value
    @revealed = revealed
  end

  def hide
    if @revealed == true
      @revealed = false
    end
  end

  def reveal
    if @revealed == false
      @revealed = true
    end
  end

  def ==(card)
    if @value == card.value
      return true
    end
    return false
  end
end
