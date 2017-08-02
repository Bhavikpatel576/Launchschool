def check_return_with_proc
  my_proc = proc { return }
  my_proc.call
  puts "This will never output to screen."
end

check_return_with_proc

#when calling the method, the proc will return nothing as nothing was returned, and exit out of the method
#skipping line 4 within the method. We won't have any issues as the proc is within the method

# Group 2
my_proc = proc { return }

def check_return_with_proc_2(my_proc)
   my_proc.call
end

check_return_with_proc_2(my_proc)

#my_proc is passed in as an arugment and the proc is called on line 16
#the call to the proc is outside of the method, which triggers an error,
#since we cannot return from the top level of the program

# Group 3
def check_return_with_lambda
  my_lambda = lambda { return }
  my_lambda.call
  puts "This will be output to screen."
  puts " "
  puts "remaining line."
end

check_return_with_lambda

#will output "This will be output to screen"
#when we define and return from within the method, then program execution
#jumps to where the Lambda is defined. After that, code execution proceeds
#to the next line after the method call. 

# Group 4
my_lambda = lambda { return }
def check_return_with_lambda(my_lambda)
  my_lambda.call
  puts "This will be output to screen."
end

check_return_with_lambda(my_lambda)
#program execution continues on the next line, so no error is thrown
#works the same as group 3

# Group 5
def block_method_3
  yield
end

block_method_3 { return }

#will yeild the block, but will throw an error because it cannot
#return from outside the method.