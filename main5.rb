def first_function(second_function)
  puts "Hello world"
  second_function.call
end

test_function = Proc.new {puts "I really tolerate Ruby and my notes!"}
second_function(test_function)
