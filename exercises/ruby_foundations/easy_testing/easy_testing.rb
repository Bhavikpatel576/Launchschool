require 'date'
require 'bundler/setup'
require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

value = 'zyx'

# assert(value.odd?, "its not odd!")
assert_equal 'zyx', value.downcase