puts "==============================="
puts "Class_RoR_Learning HW1: Calculator by Atlas"
puts "==============================="

def isNumber(v)
  v =~ /\A[-+]?[0-9]*\.?[0-9]+\Z/
end

def isDenominatorZero(num2, op)
  r = (op == "/" && num2 == 0)
  if r
    puts "Denominator is zero. Please enter non-zero value"
    return r
  end
end

begin
  puts "Please enter number1:"
end while (!isNumber(num1 = gets.chomp.upcase))

begin
  puts "Please enter operator +, -, *, / :"
end while !["+", "-", "*", "/"].include?(op = gets.chomp.upcase)

begin
  puts "Please enter number2:"
end while (!isNumber(num2 = gets.chomp.upcase) || isDenominatorZero(num2.to_i, op))

result = nil;
case op
when "+" then result = num1.to_i + num2.to_i
when "-" then result = num1.to_i - num2.to_i
when "*" then result = num1.to_i * num2.to_i
when "/" then result = num1.to_i / num2.to_i
end

puts "The operation result= #{result}"
