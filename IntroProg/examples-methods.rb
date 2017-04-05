

names = ['dave', 'sally', 'geroge', 'jessica']
activities = ['walking', 'running', 'cycling']

def named(names)
	names.sample
end

def activity(activities)
	activities.sample
end

def sentence(names, activities)
	p named(names) + " went " + activity(activities) + " today!"
end

sentence(names, activities)

def assign_name(name = 'Bhavik')
	name = name
end

p assign_name('jason')

def dayornight(daylight)
	daylight == true ? "It's daytime" : "It's nighttime"
end

daylight = [true,false].sample

p "#{daylight}: #{dayornight(daylight)}"

def car(car1, car2)
	p car1 + " " + car2
end

car("toyota", "honda")

#greeting through methods
def h
	'hello'
end

def w
	'world'
end

p "#{h} #{w}"

def greet
	h + ' ' + w
end

p greet
