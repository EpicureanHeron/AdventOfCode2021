def setup(file_str):

    filename = file_str
    with open(filename, 'r') as f:
        data = []
    
        for line in f.readlines():    
            # print(line)
            line = line.rstrip('\n').split(' -> ')
            tuple_line = []
            for pair in line:
                tuple_pair = tuple(map(int, pair.split(',')))
                tuple_line.append(tuple_pair)
            
            data.append(tuple_line)
    # set the numbers to call


    return data

def only_vert_or_horizontal_lines(data):
    only_vert_or_horizontal_data = []
    for pair_of_coordinates in data:
        if pair_of_coordinates[0][0] == pair_of_coordinates[1][0]:
            only_vert_or_horizontal_data.append(pair_of_coordinates)

        if pair_of_coordinates[0][1] == pair_of_coordinates[1][1]:
            only_vert_or_horizontal_data.append(pair_of_coordinates)

        

    return only_vert_or_horizontal_data

def only_vert_or_horizontal_diag_lines(data):
    only_vert_or_horizontal_diag_data = []
    for pair_of_coordinates in data:
        coord_rate = determine_if_45(pair_of_coordinates[0], pair_of_coordinates[1])
        if pair_of_coordinates[0][0] == pair_of_coordinates[1][0]:
            only_vert_or_horizontal_diag_data.append(pair_of_coordinates)

        elif pair_of_coordinates[0][1] == pair_of_coordinates[1][1]:
            only_vert_or_horizontal_diag_data.append(pair_of_coordinates)
        elif coord_rate == True:
            print(pair_of_coordinates)
            only_vert_or_horizontal_diag_data.append(pair_of_coordinates)
        # elif abs((pair_of_coordinates[0][0] -pair_of_coordinates[1][0])) == abs(pair_of_coordinates[0][1] -pair_of_coordinates[1][1]):
        #     # print(pair_of_coordinates)
        #     only_vert_or_horizontal_diag_data.append(pair_of_coordinates)

    return only_vert_or_horizontal_diag_data

def determine_if_45(coord1, coord2):

    x_delta = coord1[0] - coord2[0]
    y_delta = coord1[1] - coord2[1]

    try:
        rate = x_delta / y_delta
    except:
        rate = 0

    if rate == 1.0 or rate == -1.0:
        return True
    else:
        return False

def create_grid(test=False):
    grid = []
    grid_x= [iter for iter in range(999)]
    
    grid_y = [iter for iter in range(999)]

    if test == True:
        grid_x= [iter for iter in range(10)]
    
        grid_y = [iter for iter in range(10)]
    for x in grid_x:
        for y in grid_y:
            grid.append((x, y))

    return grid

def counter_object_list(grid):
    counter_list = [0 for iter in range(len(grid))]
    # print(counter_list)
    return counter_list

def solver(vh_data, grid, counter_object_list):
    for idx, coordinate in enumerate(grid):
        for line_data in vh_data:
            # check if x values match 
            if coordinate[0] == line_data[0][0] & line_data[0][0] == line_data[1][0]:
                # get both y values 
                y_values = [line_data[0][1], line_data[1][1]]
                # check to see if the coordinate is on the same line between the min and max of the ys
                if min(y_values) <= coordinate[1]  <= max(y_values):
                    counter_object_list[idx] += 1
                   
            # check if y values match
            elif coordinate[1] == line_data[0][1] & line_data[0][1] == line_data[1][1]:
                x_values = [line_data[0][0], line_data[1][0]]
                if min(x_values) <= coordinate[0]  <= max(x_values):
                    counter_object_list[idx] += 1

            # else:
            #     rate1 = determine_if_45(coordinate, line_data[0])
            #     rate2 = determine_if_45(coordinate, line_data[1])     
            #     if (rate1 == True) & (rate2 == True):
                   
            #         x_values = [line_data[0][0], line_data[1][0]]
            #         y_values = [line_data[0][1], line_data[1][1]]
            #         if (min(y_values) <= coordinate[1]  <= max(y_values) &  min(x_values) <= coordinate[0]  <= max(x_values)):
            #             print("coordinate : " + str(coordinate))
            #             print("line data " + str(line_data))
            #             counter_object_list[idx] += 1
            elif abs(coordinate[0] - line_data[0][0]) == abs(coordinate[1] -line_data[0][1]):
                
                
                x_values = [line_data[0][0], line_data[1][0]]
                y_values = [line_data[0][1], line_data[1][1]]
                if min(y_values) <= coordinate[1]  <= max(y_values):
                    if min(x_values) <= coordinate[0]  <= max(x_values):
                        
                        counter_object_list[idx] += 1
    # max_intersection_count = max(counter_object_list)

    answer = 0
    for value in counter_object_list:
        if value >= 2:
            answer+= 1

    print(answer)

def main():
    data = setup('data.txt')
    vh_data = only_vert_or_horizontal_diag_lines(data)
    # vh_data = only_vert_or_horizontal_lines(data)
    # grid= create_grid(test=True)
    grid = create_grid()
    counter_list = counter_object_list(grid)
    solver(vh_data, grid,counter_list)
main()