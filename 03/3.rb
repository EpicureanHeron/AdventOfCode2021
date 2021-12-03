def part1    
    lines = File.readlines("data.txt") 
    # lines = File.readlines("test.txt") 

    ones_counter_arr =   [0,0,0,0,0,0,0,0,0,0,0,0]
    gamma_rate =    [0,0,0,0,0,0,0,0,0,0,0,0]
    episolon_rate = [0,0,0,0,0,0,0,0,0,0,0,0]
    line_counter = 0

    lines.each do |line|
        line_arr = line.split('')
        index_counter = 0

        line_arr.each do |char|
            if char == '1'

                ones_counter_arr[index_counter] += 1       
            end
            index_counter += 1
        end
        line_counter += 1
    end
    counter_selector = 0
    # puts counter_arr
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

def part2

    lines = File.readlines("data.txt") 

    ones_counter_arr =   [0,0,0,0,0,0,0,0,0,0,0,0]

    line_counter = 0

    lines.each do |line|
        line_arr = line.split('')
        index_counter = 0

        line_arr.each do |char|
            if char == '1'

                ones_counter_arr[index_counter] += 1       
            end
            index_counter += 1
        end
        line_counter += 1
    end
# the above works to determine the appropriate ones values
    ones_index = 0

    oxy_lines = File.readlines("data.txt") 

    ones_counter_arr.each do |value|

        index_counter = 0
      
        if oxy_lines.length() == 1
            puts oxy_lines[0]

        end

        indexes_to_remove = []
        indexes_to_remove.clear

      
        oxy_lines.each do |line|

            if line[ones_index].to_s != value.to_s
              
                indexes_to_remove.push(index_counter)
            end

            index_counter += 1

        end
        
        indexes_to_remove.each do |index_value|
            oxy_lines.delete_at(index_value)
        end
        ones_index += 1
        # puts oxy_lines
        # puts "-------------"
        
    end

    co_lines = File.readlines("data.txt") 

    ones_counter_arr.each do |value|

        index_counter = 0
      
        if co_lines.length() == 1
            puts co_lines[0]
            
        end

        indexes_to_remove = []
        indexes_to_remove.clear

      
        co_lines.each do |line|

            if line[ones_index].to_s == value.to_s
              
                indexes_to_remove.push(index_counter)
            end

            index_counter += 1

        end
        
        indexes_to_remove.each do |index_value|
            co_lines.delete_at(index_value)
        end
        ones_index += 1
        # puts oxy_lines
        # puts "-------------"
        
    end



         

end
part2()