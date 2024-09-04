# P3
# display first 100 reverse prime numbers (emirps) Emirps aren't palindromic

	print("First 100 Emirps: ")

	emirp_counter = 0

	# emirps start from 2 digits
	number = 10

	while emirp_counter <= 100:

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


			# check if reversed number is prime
			is_prime = True
			for factor in range (2, (reverse // 2) + 1):
					if reverse % factor == 0:
							is_prime = False
							break

			# if reverse number is not prime then check for the next number
			if not is_prime:
					number = number + 1
					continue

			# Emirps can't be palindromic
			if number != reverse:
					print(f"{number}", end = ", ")

			# move to new line after 10 numbers have been printed
			if emirp_counter % 10 == 0:
					print()

			emirp_counter = emirp_counter + 1
			number = number + 1
