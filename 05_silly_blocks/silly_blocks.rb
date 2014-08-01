# takes a block and reverses the result of the block
#
def reverser
  yield.split.map(&:reverse).join(' ')
end

# adds one to the result of the block
#
def adder(amount=1)
  yield + amount
end

# repeatedly call a block a number of times
#
def repeater(count=1)
  count.times {|ii| yield }
end
