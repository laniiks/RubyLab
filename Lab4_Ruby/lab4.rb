class CashMashine
    def initialize(path, starting_balance)
        @path = path
        @starting_balance = starting_balance
    end

    def balanceFile
        if File.file? @path.to_s
            File.open(@path.to_s)
        else
            file = File.open(@path.to_s, 'w')
            file.puts(@starting_balance).to_s
            file.close
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
        File.open(@path.to_s, 'w') do |file|
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
        File.open(@path.to_s, 'w') do |file|
          file.puts(value)
        end
        puts("Новый баланс: #{balance}")
        balanceFile.close
    end
end

def main
    cashMashine = CashMashine.new('balance.txt', 100.0)
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
          cashMashine.deposit
        when 'W'
          print('Сумма списания: ')
          cashMashine.withdraw
        when 'B'
          puts("Баланс #{cashMashine.balance}")
        when 'Q'
          break
        end
      end
end

main
