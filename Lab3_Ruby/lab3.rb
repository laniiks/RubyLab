
def exercise(age)
  file = File.open('Lab3_Ruby/file.txt')
  result = File.open('Lab3_Ruby/result.txt', 'w')
  file_data = file.readlines.map(&:chomp)
  i = 0
  while i < file_data.length
    str = file_data[i]
    result.puts(str) if str[-2, 2] == age
    i += 1
  end
  file.close
  result.close
  puts(file_data = File.read('Lab3_Ruby/result.txt').split("\n"))
end

def main
  loop do
    puts 'Выберите, что хотите сделать:'
    print("\n")
    puts '1 - Выбрать студентов по возрасту'
    print("\n")
    puts '-1 - Выход'
    print("\n")
    i = gets.chomp
    case i
    when '1'
      print 'Введите возраст студентов: '
      age = gets.chomp
      exercise(age)
      puts(file_data = File.read('Lab3_Ruby/result.txt').split("\n"))
    when '-1'
      break
    else
      break
    end
  end
end

main
