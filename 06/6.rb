class FishSchool
    attr_reader :day, :school, :fish_to_generate
    def initialize
        @day = 0
        @school = []
        @fish_to_generate = 0
    end

    def populate_school(list_values)
        list_values.each do |value|
            fish = Fish.new(value)
            @school << fish   
        end
    end

    def increment_day
        @day += 1
        update_state_of_school
    end

    def update_state_of_school
        @school.each do |fish|
            
            fish.increment_counter
            if fish.regenerate?
                @fish_to_generate += 1
            end
        end
    end

    def generate_new_fish
        i = 0
        while i < @fish_to_generate do 
            fish = Fish.new(8)
            @school << fish   
            i += 1 
        end
        @fish_to_generate = 0
    end

    def school_size
        puts @school.length()
    end

    def school_counter_population
        counter_array = []
        @school.each do |fish|
            counter_array << fish.life_counter
        end
        pretty_counter = counter_array.compact.join(", ")
        puts pretty_counter
        
    end

end

class Fish
    attr_accessor :life_counter, :regenerate_value
    def initialize(counter)
        @life_counter = counter
        @regenerate_value = false
        @recently_generate = true
    end

    def regenerate?
        if @life_counter == 0
            @regenerate_value = true
        else
            @regenerate_value = false
        end
    end

    def increment_counter
        if @recently_generate ==true && @life_counter == 8
            @recently_generate = false
        
        else
            @life_counter -= 1
            if @life_counter < 0
                @life_counter = 6
            end
        end
    end

    def output_counter
        puts @life_counter
      
    end

end

school = FishSchool.new
# list_values = [3,4,3,1,2]
list_values = [3,5,1,2,5,4,1,5,1,2,5,5,1,3,1,5,1,3,2,1,5,1,1,1,2,3,1,3,1,2,1,1,5,1,5,4,5,5,3,3,1,5,1,1,5,5,1,3,5,5,3,2,2,4,1,5,3,4,2,5,4,1,2,2,5,1,1,2,4,4,1,3,1,3,1,1,2,2,1,1,5,1,1,4,4,5,5,1,2,1,4,1,1,4,4,3,4,2,2,3,3,2,1,3,3,2,1,1,1,2,1,4,2,2,1,5,5,3,4,5,5,2,5,2,2,5,3,3,1,2,4,2,1,5,1,1,2,3,5,5,1,1,5,5,1,4,5,3,5,2,3,2,4,3,1,4,2,5,1,3,2,1,1,3,4,2,1,1,1,1,2,1,4,3,1,3,1,2,4,1,2,4,3,2,3,5,5,3,3,1,2,3,4,5,2,4,5,1,1,1,4,5,3,5,3,5,1,1,5,1,5,3,1,2,3,4,1,1,4,1,2,4,1,5,4,1,5,4,2,1,5,2,1,3,5,5,4,5,5,1,1,4,1,2,3,5,3,3,1,1,1,4,3,1,1,4,1,5,3,5,1,4,2,5,1,1,4,4,4,2,5,1,2,5,2,1,3,1,5,1,2,1,1,5,2,4,2,1,3,5,5,4,1,1,1,5,5,2,1,1]
school.populate_school(list_values)
i = 1
days = 256 
school.school_counter_population
while i < days do i += 1 
    
    # puts "day #{i}"
    # school.school_counter_population
   
    school.increment_day
    school.generate_new_fish
    
   
end
school.school_size