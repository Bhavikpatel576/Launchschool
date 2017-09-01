
p "----question 1------"
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
p ages[:Spot]
p '-correct answer for question 1'
p ages.key?(:Spot)

p "----question 2------"
munsters_description = "The Munsters are creepy in a good way."
p munsters_description.downcase
p munsters_description.upcase
p munsters_description.swapcase

p "----question 3------"
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10 }
# add additional_ages = { "Marilyn" => 22, "Spot" => 237 }
ages["Marilyn"] = 22
ages["Spot"] = 237
p ages

p "----question 4------"
advice = "Few things in life are as important as house training your pet dinosaur."
# does advice contain the word dino?
p advice.include?('Dino')
# Launch school 
p advice.match('Dino')

p "----question 5------"
# find an easier way to write the array 
#flintstones = ["Fred", "Barney", "Wilma", "Betty", "BamBam", "Pebbles"]
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
p flintstones

p "----question 6------"
flintstones << 'Dino'
p flintstones

p "----question 7------"
flintstones.push('Dino1', 'Harry')
p flintstones
#alternative 
p flintstones.concat(%w(Larry, Jerry))

p "----question 8------"
advice = "Few things in life are as important as house training your pet dinosaur."
p advice.slice(0,advice.index('house'))

p "----question 9------"
statement = "The Flintstones Rock!"
# in one line count the number of lower case t's
p statement.count('t')

p '-----question 10-----'
title = "Flintstone Family Members"
#cneter the title if we have a table below with a char count of 40
p title.length
add_whitespaces = title.length/2
p add_whitespaces.times {|_| title.prepend(' ')}
p title

p 'launch school answer'
title_ls = "Flintstone Family Members"
p title_ls.center(40)










