
[2, 3, 5].inject do |total, num| 
  puts num
  num + num
end
# p [2, 3, 5].inject { |total, num| total + num }
