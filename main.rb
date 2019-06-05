# Introduction to Ruby

# create variables just by giving them a name
#no let, const, or var

name = "Morgan Fox"
score = 100

#To determine an object's data type use the
# .class method

name.class # String
score.class # Integer

# Arrays look just the same in most languages

names = ['Matthew', 'Morgan', 'Joy']
scores = [22, 33, 47]

#'Objects' in Ruby are called hashes

# old syntax
hash = {:name => 'Morgan Fox', :score => 100}
hash = {name: 'Morgan Fox', score: 100}

hash['name'] # Morgan Fox
hash['score'] # 100

# Ruby has a special data type calld symbols
# Symbols are basically screens but they are immutable

:score # This is a symbols


# Typecasting in Ruby

"200".to_i # converts this to an Integer
20.to_f # converts this to floating point number
20.to_s # converts this to a string

# To typecast something to an Array you need an iterable object
('a'..'z').to_a
# Range in Ruby

# To Typecast something to a hash you need a multi-dimensional array

multi_array.to_h

# To know what is possible wiht any specific object call .methods on it
