require 'date'

def main(birthdays)
  birthdays.each do | birthday |
    define_room(birthday)
  end
end

def define_room(birthday)
  birth = Date.parse(birthday)
  age = calculate_age(birth)
  room = check_room(age)

  puts "Nascidos em #{birthday} - sala #{room}"
end

def check_room(age)
  if age[:y] <= 25
    if age[:m] < 2
      room = 1
    elsif age[:m] == 2 && age[:d] <=15
      room = 1
    elsif age[:m] == 2 && age[:d] >=16
      room = 2
    end

  elsif age[:y] > 25 && age[:y] <= 45
    if age[:y] < 45
      room = 2
    elsif age[:y] == 45
      if age[:m] == 0
        room = 2
      elsif age[:m] == 1 && age[:d] == 0
        room = 2
      else
        room = 3
      end
    end

  elsif age[:y] > 45 && age[:y] <= 65
    if age[:y] == 65 && age[:m] <= 0 && age[:d] <= 0
      room = 3
    elsif age[:y] == 65
      room = 4
    else
      room = 3
    end
  else
    room = 4
  end

  room
end

def calculate_age(birth)
  today = Date.today

  years = today.year - birth.year
  months = today.month - birth.month
  days = today.day - birth.day

  days_past_month = days_in_month(today.month - 1, today.year)

  if days.negative?
    days += days_past_month
    months -= 1
  end

  if months.negative?
    months += 12
    years -= 1
  end

  {d: days, m: months, y: years}
end

def days_in_month(month, year)
  months_30_days = [4, 6, 9, 11]

  if month == 2
    days = year.bissextile?(year) ? 29 : 28
  elsif months_30_days.select { |m| m == month }.nil?
    days = 30
  else
    days = 31
  end

  days
end

def bissextile?(year)
  if year % 400 == 0
    type = true
  elsif year % 4 == 0 && year % 100 != 0
    type = true
  else
    type = false
  end
  type
end

#Start here
birthdays = [
              '09/02/1995', '18/01/1995', '17/01/1995',
              '03/03/1975', '02/03/1975', '01/03/1975',
              '01/04/1955', '02/04/1955', '03/04/1955',
              '01/01/1944'
            ]

main(birthdays)
