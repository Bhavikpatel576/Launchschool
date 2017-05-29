# p [1,2,3].first(2)

# ahash = { a: "ant", b: "bear", c: "cat" }

# p ahash.first(2)
# p ''


# def joinor(array, character = ' ', word = 'or')
#   len = array.size - 1
#   case len
#   when 0 then ''
#   when 1 then array.first
#   when 2 then array.join(" #{word} ")
#   else
#   	array[-1] = "#{word} #{array.last}" # joins the last element as one word
#   	array.join(character)
#   end
# end

# p joinor([1,2,3,4,5], '; ', 'and')


#test variable scope

def varscop(param)
	param + "world"
	param += " universe"
	param << "galaxy"
end

str = "string"

varscop(str)

p str