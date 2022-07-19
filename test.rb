

def lol(a)
  a.each do |num|
    return "test" if num > 4
    p num
  end
  "LOOOOOOOOOOOOOOOOOOOOL"
end

def my_method(&number)
  number.call
end

case { a: 'apple', b: 'banana' }
in {ab: a, b: b}
  puts "lalalal"
in { a: a, b: b }
  puts a
  puts b
end

login = { username: 'hornby', password: 'iliketrains' }

login => { username: username }

puts "Logged in with username #{username}"
def loop(n)
  (1..n).each { |i|
    puts i
  }
end

a = [1, 2, 3, 4, 5]
b = [6]

p a > b
