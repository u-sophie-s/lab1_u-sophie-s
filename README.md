KIGAI FULL SELF DRIVING CAR SILUMATION

This project is the individual coding lab (lab1) that simulates a complete self driving car traveling from ALU to the Kigali Convention Center. The whole journey is described as a list called "road". Each item in the list is either a sign or just the bare road.

The assignment for individual coding lab was to write the logic for functions in road_simulation.py. The web page (index.html) acts as a TV describing what the python program decides.

WHAT THE FUNCTIONS IN road_simulation.py DO

is_valid_sign(sign)

Returns True only if the sign is text and is "bus", "zebra", or a number from 20 to 100 written as text. Otherwise False.

get_sign_type(sign)

Classifies a sign. Returns "bus", "zebra", "speed" (a number) or "road" (anything else). It classifies only, it does not check the range.

get_speed_limit(sign, current_limit)

If the sign is a speed sign, returns its number as an int. Otherwise keeps the current limit.

get_target_speed(limit, stop_timer)

Returns 0 while stop_timer is above 0 (the car is stopped at a zebra), otherwise returns the speed limit.

adjust_speed(speed, target)

Moves the speed ONE step towards the target. Below the target it adds ACCELERATION (never going above the target). Above the target it subtracts BRAKING (never going below the target). Called once per tick, so speed changes gradually

count_signs(road_list)

Uses a loop to count the road's signs. Returns (speed_signs, zebras, buses).

ask_for_number(question, low, high)

Keeps asking until the user types a whole number from low to high. Uses try/except to handle text that is not a number, and returns the number as an int.

insert_sign(road_List, sign, position)

Inserts a sign at a position. Returns False if the position is not from 0 to len(road_list) (inserting at the end is allowed), otherwise inserts and returns True. Also rejects invalid signs.

replace_sign(road_list, sign, index)

Replaces the sign at an index. Returns False if the index is not from 0 to len(road_list) - 1, otherwise replaces and returns True. Also rejects invalid signs.

get_journey_summary(road_list)

Uses a loop to count the signs passed (every segment that is not "road"). Returns (signs_passed, length_m, START_NAME, END_NAME), where length_m is the number of segments times SEGMENT_M.

HOW TO RUN THE PROJECT

1. Make sure Python or Python3 is installed
2. Open a terminal in the lab folder
3. Run and from the menu choose, start driving
4. Open the visual web page
5. In the terminal click enter
6. Your FSD car is now moving !

LIMITATIONS

The car reacts to a zebra crissing or a bus once the engine hands it that sign, therefore breaking from a higher speed takes several ticks. Because of this, the car can appear to BRAKE or change lanes slightly late.