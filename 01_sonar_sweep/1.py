def part1():

    file1 = open('1.txt', 'r')
    greater_count = -1
    
    # Using for loop
    previous_value = 0

    for line in file1:
        current_value = int(line.rstrip())


        if current_value > previous_value:
            greater_count += 1

        previous_value = current_value

    print(greater_count)

def part2():
    file1 = open('1.txt', 'r')
    greater_count = 0
    
    # Using for loop
    previous_value = 0

    list_of_values = []
    for line in file1:
        current_value = int(line.rstrip())
        

        list_of_values.append(current_value)
    print(len(list_of_values))
    for i, val in enumerate(list_of_values):

        if i + 2 <= len(list_of_values)-1:
          
           current_value = list_of_values[i] + list_of_values[i+1] + list_of_values[i+2]

        if previous_value != 0:
          
            if current_value > previous_value:
               greater_count += 1
        
        previous_value = current_value


    print(greater_count)

