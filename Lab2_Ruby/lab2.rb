def firstScript(word)
  word2 = word.split(' ')[1].downcase
  if word2.end_with?('cs')
    puts "Длина слова #{word2.length}"
    puts "2 в степени #{word2.length} = #{2**word2.length}"
  else
    puts "Слово #{word2} задом наперед #{word2.reverse}"
  end
end

def secondScript(size)
  pokemon = {}
  i = 1
  size.times do
    puts "Введите имя и цвет покемона №#{i}"
    print 'Имя: '
    name = gets.chomp
    print 'Цвет: '
    color = gets.chomp
    pokemon[name] = color
    i += 1
  end
  puts
  pokemon.each_key do |key|
    puts "Имя: #{key}, Цвет: #{pokemon[key]}"
  end
end

def main
  loop do
    puts
    puts "Введите 1: Скрипт, который принимает слово, если слово заканчивается на “CS” -
    выводит на экран цифру 2 в степени (длины введенного слова),
    если не заканчивается - выводит слово задом наперед"
    puts 'Введите 2: Скрипт, который выводит массив покемонов'
    puts 'Введите -1: Выход'
    input = gets.to_i
    case input
    when 1
      print 'Введите слово: '
      word = gets.chomp
      firstScript(word)
    when 2
      print 'Введите размер массива: '
      size = gets.to_i
      secondScript(size)
    else -1
         break
    end
  end
end

main
