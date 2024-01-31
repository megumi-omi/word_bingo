cardSize = gets.chomp.to_i
card = Array.new(cardSize) { gets.chomp.split }
wordSize = gets.chomp.to_i
words = Array.new(wordSize) { gets.chomp }

def judgment(card, cardSize)
  (0...cardSize).each do |j|
    column = (0...cardSize).map { |i| card[i][j] }
    return true if column.uniq.length == 1
  end
  (0...cardSize).each do |i|
    return true if card[i].uniq.length == 1
  end

  diagonalLeft = (0...cardSize).map { |i| card[i][i]}
  return true if diagonalLeft.uniq.length == 1

  diagonalRight = (0...cardSize).map { |i| card[i][cardSize - i - 1] }
  return true if diagonalRight.uniq.length == 1
end

# 選ばれた単語がビンゴカードの中にあった場合、ビンゴカードのその単語に印を付ける。
words.each do |word|
  (0...cardSize).each do |i|
    (0...cardSize).each do |j|
      card[i][j] = 'X' if card[i][j] == word
    end
  end

  if judgment(card, cardSize)
    puts "yes"
    exit
  end
end

puts "no"