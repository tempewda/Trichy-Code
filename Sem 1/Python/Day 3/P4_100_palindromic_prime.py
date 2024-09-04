# P4
# print first 100 palindromic prime numbers

print("First 100 Palindromic Prime Numbers: ")
pp_counter = 0

# Palindromic primes start from 2
number = 2

while pp_counter <= 100:

	# check if number is prime
	is_prime = True
	for factor in range (2, (number // 2) + 1):
		if number % factor == 0:
			is_prime = False
			break

	# if number is not prime then check for the next number
	if not is_prime:
		number = number + 1
		continue

	# reverse the number
	reverse = 0
	temp = number
	while temp > 0:
		last_digit = temp % 10
		reverse = (reverse * 10) + last_digit
		temp = temp // 10


	# check if prime number is palindromic
	if number == reverse:
		print(f"{number}", end = ", ")
		pp_counter = pp_counter + 1

	number = number + 1
