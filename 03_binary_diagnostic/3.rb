def part1    
    lines = File.readlines("data.txt") 
    # lines = File.readlines("test.txt") 

    # ones_counter_arr =  Array.new(lines[0].length()-1, 0)
    gamma_rate =    Array.new(lines[0].length()-1, 0)
    episolon_rate = Array.new(lines[0].length()-1, 0)
    line_counter = 0

    ones_counter_arr = evaulate(lines)
    puts ones_counter_arr
    counter_selector = 0
    # puts counter_arr
    line_counter = lines.length()
    ones_counter_arr.each do |value|
        if value.to_i > (line_counter.to_i/2)
            gamma_rate[counter_selector] = 1
            episolon_rate[counter_selector] = 0
        else
            gamma_rate[counter_selector] = 0
            episolon_rate[counter_selector] = 1
        end
        counter_selector += 1
    end
    puts episolon_rate.join()
    puts gamma_rate.join()
    puts binary_ep = episolon_rate.join().to_i(2) 
    puts binary_gamma = gamma_rate.join().to_i(2)
    puts binary_ep * binary_gamma
end

def evaulate(file_arr)
    # https://stackoverflow.com/questions/24432225/fill-array-with-element-n-times
    ones_counter_arr =  Array.new(file_arr[0].length()-1, 0)
    file_arr.each do |line|
        line_arr = line.split('')
        index_counter = 0

        line_arr.each do |char|
            if char == '1'

                ones_counter_arr[index_counter] += 1       
            end
            index_counter += 1
        end
        # line_counter += 1
    end
    return ones_counter_arr
end

def part2

    lines = File.readlines("data.txt") 

    ones_counter_arr = evaulate(lines)

    oxy_lines = File.readlines("data.txt") 

    oxy_cycle = 0
    while oxy_lines.length() > 1 do
       
        # this gets the total number of the ones in each index for the current iteration
        ones_counter_arr = evaulate(oxy_lines)
        # this gets the total line count of the current mutation of oxy_lines
        lines_value = oxy_lines.length()

        pattern_array = []

        ones_counter_arr.each do |amt|
            if amt >= (lines_value - amt)
                pattern_array.push(1)
            elsif amt < (lines_value - amt)
                pattern_array.push(0)
            end
        end


        keep_array = []
    
        oxy_lines.each do |oxy_line|
            if oxy_line[oxy_cycle].to_s == pattern_array[oxy_cycle].to_s
                keep_array.push(oxy_line)
                
            end
        end
        oxy_lines.clear
        oxy_lines = keep_array
        oxy_cycle += 1
    end
    puts oxy_lines
    co_lines = File.readlines("data.txt") 
    ones_index = 0
    co_cycle = 0
    while co_lines.length() > 1 do
       
        # this gets the total number of the ones in each index for the current iteration
        ones_counter_arr = evaulate(co_lines)
        # this gets the total line count of the current mutation of oxy_lines
        lines_value = co_lines.length()

        pattern_array = []

        ones_counter_arr.each do |amt|
            if amt < (lines_value - amt)
                pattern_array.push(1)
            elsif amt >= (lines_value - amt)
                pattern_array.push(0)
            end
        end


        keep_array = []
    
        co_lines.each do |co_line|
            if co_line[co_cycle].to_s == pattern_array[co_cycle].to_s
                keep_array.push(co_line)
                
            end
        end
        co_lines.clear
        co_lines = keep_array
        co_cycle += 1
    end
    value_co  = co_lines[0].to_i(2)
    value_oxy = oxy_lines[0].to_i(2)
  
    puts value_co * value_oxy
end
part2()
