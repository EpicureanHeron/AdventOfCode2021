def setup():
    # modified the answer on SO https://stackoverflow.com/questions/48773799/read-file-line-by-line-split-its-content-skip-empty-lines
    filename = 'data.txt'
    with open(filename, 'r') as f:
        data = []
        box_data = []
        for line in f.readlines():    
            line = line.rstrip('\n')
            if not line:
                data.append(box_data)
                box_data = []
                continue
            line_list = [s for s in line.split(' ') if s]
            box_data.append(line_list)
    # set the numbers to call
    numbers_to_call = data[0][0][0].split(',')
    # remove the numbers to call from the data list so it is just squares data in a list
    data.pop(0)

    return data, numbers_to_call


def vertical_winner(card_list_of_lists, numbers_called_list):
    #https://stackoverflow.com/questions/34347043/how-can-i-rotate-this-list-of-lists-with-python
    newgrid = []
    for i in range(len(card_list_of_lists[0])): 
        newgrid.append([x[i] for x in card_list_of_lists])
    card_list_of_lists =  newgrid

    line_match_dictionary = {
        0:0,
        1:0,
        2:0,
        3:0,
        4:0
    }
    for number in numbers_called_list:
        current_line_number = 0
        for row in card_list_of_lists:
            if number in row:
                line_match_dictionary[current_line_number] += 1
                if line_match_dictionary[current_line_number] == 5:
                   return True
            
            current_line_number += 1
    return False


def horizontal_winner(card_list_of_lists, numbers_called_list):

    line_match_dictionary = {
        0:0,
        1:0,
        2:0,
        3:0,
        4:0
    }

    for number in numbers_called_list:
        current_line_number = 0
        for row in card_list_of_lists:
            if number in row:
                line_match_dictionary[current_line_number] += 1
                if line_match_dictionary[current_line_number] == 5:
                #  print(current_line_number)
                    return True
            
            current_line_number += 1
    return False

def calculate_winning_value(card_list_of_lists, numbers_called_list, last_digit_called):
    unmarked = []

    for row in card_list_of_lists:
        for value in row:
            if value not in numbers_called_list:
                unmarked.append(value)

    total = 0

    for unmarked_value in unmarked:
        total += int(unmarked_value)
        
    calulation = total * int(last_digit_called)

    return calulation


def main():
    winner = False
    data, numbers_to_call = setup()

    cards_which_have_not_won = [iter for iter in range(99)]

    numbers_called = []
    print(data[44])
    last_card = -1
    for number in numbers_to_call:
        winner = False

        numbers_called.append(number)
      
        for idx, card_list_of_lists in enumerate(data):
            
            vertical_winner_result = vertical_winner(card_list_of_lists, numbers_called)
            horizontal_winner_result = horizontal_winner(card_list_of_lists, numbers_called)

            if vertical_winner_result == True or horizontal_winner_result == True:
                winner = True

            if winner == True:
                # uncomment for part one winner
                # calulation  = calculate_winning_value(card_list_of_lists, numbers_called, number)
                winner = False
                
                if idx in cards_which_have_not_won:
                    
                    cards_which_have_not_won.remove(idx)
                    
                    if len(cards_which_have_not_won) == 1:
                        print(cards_which_have_not_won)
                        print('here')
                        last_card_idx = cards_which_have_not_won[0]
                        last_card = data[last_card_idx]
                        print(cards_which_have_not_won)
                        # calulation  = calculate_winning_value(card_list_of_lists, numbers_called, number)

                        # print(calulation)
        

    numbers_called_final = []
    print(last_card)
    for number in numbers_to_call:
        winner_final = False

        numbers_called_final.append(number)
        vertical_winner_result = vertical_winner(last_card, numbers_called_final)
        horizontal_winner_result = horizontal_winner(last_card, numbers_called_final)
        if vertical_winner_result == True or horizontal_winner_result == True:
            winner_final = True

        if winner_final == True:
            calulation  = calculate_winning_value(last_card, numbers_called_final, number)
            print(calulation)
            break
main()