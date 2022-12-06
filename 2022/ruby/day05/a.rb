stack_inputs, move_inputs = File.read('inputs.txt').split("\n\n").map { |l| l.split("\n") }
num_of_stacks = stack_inputs.pop[-2].to_i

stacks = (1..num_of_stacks).reduce({}) do |h, i|
  h[i] = []
  h
end

stack_inputs.each do |line|
  line.split('')[1..].each_slice(4).with_index do |slice, i|
    crate = slice.first
    stacks[i + 1].unshift(crate) if crate != ' '
  end
end

move_inputs.each do |moves|
  moves = moves.split(' ')
  move, from, to = moves.values_at(* moves.each_index.select { |i| i.odd? }).map(&:to_i)
  while move > 0
    stacks[to] << stacks[from].pop
    move -= 1
  end
end

results = ''
stacks.each { |_, stack| results += stack.last }
puts results

