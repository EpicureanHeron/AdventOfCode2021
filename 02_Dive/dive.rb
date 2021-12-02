def part1    
    lines = File.readlines("data.txt") 

    depth = 0
    horizontal = 0

    lines.each do |line|
        direction, value = line.split

        if direction == 'forward'
            horizontal += value.to_i

        elsif direction == 'down'
            depth += value.to_i

        elsif direction == 'up'
            depth -= value.to_i

        else
            puts 'OOPS'
        end
    end
    puts "depth"
    puts depth
    puts 'horiztonal'
    puts horizontal
    puts 'product'
    puts horizontal * depth
end

part1()