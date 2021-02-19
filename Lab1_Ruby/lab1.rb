def Hello(first_name, last_name, age)
    if age<18
        puts "Привет, #{first_name} #{last_name}. Тебе меньше 18 лет, но начать учиться программировать никогда не рано." 
    else
        puts "Привет, #{first_name} #{last_name} Самое время заняться делом!" 
    end
end

def Summ(a, b)
    if a==20 || b == 20
        return 20
    else
        return a+b
    end
end



def main
    while true
        puts "1: Скрипт приветствия"
        puts "2: Скрипт суммы"
        puts "0: Выход"
        input = gets.to_i
        if input == 1
            puts "Введите имя: "
            first_name = gets.chomp
            puts "Введите фамилию: "
            last_name = gets.chomp
            puts "Введите возраст: "
            age = gets.to_i
            Hello(first_name, last_name, age)
        elsif input == 2
            puts "Введите первое число: "
            a = gets.to_i
            puts "Введите второе число: "
            b = gets.to_i
            puts Summ(a, b)
        else
            break
        end
    end
end

main


