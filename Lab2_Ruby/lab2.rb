def firstScript(word)
  if word.end_with?('cs') || word.end_with?('CS')
    length = word.length
    number = 2**length
    puts "Длина слова #{length}"
    puts "2 в степени #{length} = #{number}"
  else
    reverse = word.reverse!
    puts "Слово #{word} задом наперед #{reverse}"
  end
end

def secondScript(size)
  pokemon = {}
  i = 1
  while i <= size
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
