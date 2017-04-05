name = 'Roger'

puts name.casecmp('RoGeR') == 0
puts name.casecmp('DAVE') == 0



p '-------------------------------------------------'

stoplight = ['green', 'yellow', 'red'].sample

case stoplight
when 'green' then puts 'Go!' 
when 'yellow' then puts 'Slow down!' 
else puts 'Stop!'
end


p '-------------------------------------------------'
status = ['awake', 'tried'].sample

tester = if status == 'awake'
	'Be productive1'
else
	 "Go to sleep"
end

p tester

p '-------------------------------------------------'
stoplight = ['green', 'yellow', 'red'].sample

case stoplight
when 'green'
	puts "GO!"
when 'yellow'
	puts "Slow down"
when 'red'
	puts "stop"
end

p '-------------------------------------------------'

boolean = [true,false].sample

puts boolean == true ? 'true' : 'false'
boolean == true ? puts('true') : puts('false')

p '-------------------------------------------------'
sun = ['visible', 'hidden'].sample

puts 'the sun is so bright' if sun == 'visible'
puts 'The clouds are blocking the sun!' unless sun.to_s == 'visible'