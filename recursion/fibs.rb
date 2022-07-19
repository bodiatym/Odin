def fibs(number)
  arr = [0,1]

  return [] if number == 0
  return [0] if number == 1

  numbers_quantity = number - 2
  (1..numbers_quantity).each do | i|
    arr << arr[i] + arr[i-1]
  end

  arr
end

def fibs_rec(number)
  return [] if number == 0
  return [0] if number == 1
  return [0,1] if number == 2

  fibs_rec(number - 1) << fibs_rec(number - 1)[number-3] + fibs_rec(number - 1)[number-2]
end

p fibs(17)
p fibs_rec(17)