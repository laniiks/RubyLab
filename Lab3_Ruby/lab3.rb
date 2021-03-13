
def FirstTask(age)
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

PATH = 'Lab3_Ruby/balance.txt'.freeze
STARTING_BALANCE = 100

def balanceFile
  if File.file? PATH.to_s
    File.open(PATH.to_s)
  else
    file = File.open(PATH.to_s, 'w')
    file.puts(STARTING_BALANCE).to_s
  end
end

def balance
  File.read(balanceFile)
end

def deposit
  balanceFile
  depositValue = gets.chomp.to_f
  balanceValue = balanceFile.read
  value = balanceValue.chomp.to_f
  if depositValue < 0
    abort 'Введено отрицательное число!'
    exit
  end
  value += depositValue
  File.open(PATH.to_s, 'w') do |file|
    file.puts(value)
  end
  puts("Новый баланс: #{balance}")
  balanceFile.close
end

def withdraw
  balanceFile
  withdrawValue = gets.chomp.to_f
  balanceValue = balanceFile.read
  value = balanceValue.chomp.to_f
  abort 'Введено отрицательное число!' if withdrawValue < 0
  abort 'Нехватает средств!' if value < withdrawValue
  value -= withdrawValue
  File.open(PATH.to_s, 'w') do |file|
    file.puts(value)
  end
  puts("Новый баланс: #{balance}")
  balanceFile.close
end

def main
  loop do
    puts 'Выберите, что хотите сделать:'
    puts '1 - Выбрать студентов по возрасту'
    puts '2 - Чтение банковского баланса'
    puts '-1 - Выход'
    i = gets.chomp
    case i
    when '1'
      print 'Введите возраст студентов: '
      age = gets.chomp
      FirstTask(age)
      puts(file_data = File.read('Lab3_Ruby/result.txt').split("\n"))
    when '2'
      loop do
        puts 'Выберите, что хотите сделать:'
        puts 'B - Показать баланс'
        puts 'D - Пополнить'
        puts 'W - Списать'
        puts 'Q - Выйти'
        i = gets.chomp.upcase
        case i
        when 'D'
          print('Сумма пополнения: ')
          deposit
        when 'W'
          print('Сумма списания: ')
          withdraw
        when 'B'
          puts("Баланс#{balance}")
        when 'Q'
          break
        end
      end
    when '-1'
      break
    else
      break
    end
  end
end

main
