# P1
# demonstrating for, while and do while loops to print all 4 digit palindrome numbers

print("All 4-digit Palindrome Numbers: ")

# iterate over all 4 digit numbers
for number in range(1000, 10000):

	# check for palindrome
	temp = number
	power_ten = 3
	is_palindrome = True

	while temp > 0:
		last_digit = temp % 10
		first_digit = temp // (10 ** power_ten)

		if first_digit != last_digit:
			is_palindrome = False
			break

		# remove the first and last digits
		temp = temp % (10 ** power_ten)
		temp = temp // 10

		power_ten -= 2

	if is_palindrome:
			print(f"{number} ");
