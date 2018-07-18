#!/usr/bin/ruby

def is_prime(n)
	if n <= 1
		return false
	end
	for i in 2...n
		if n % i == 0
			return false
		end
	end
	return true
end

def prime_part_constructive(n, k, lst)
	if n == 0
		puts lst.join("+")
	end
	if n <= k
		return
	end
	for i in (k+1)..(n+1)
		if not is_prime(i)
			next
		end
		prime_part_constructive(n-i, i, lst << i)
		lst.pop
	end
end

puts "Prime Partitions Program"
print "Enter a number: "
a = gets.to_i

primes = []
for i in 0..a
	if is_prime(i)
		primes << i
	end
end

puts "Primes up to #{a}: #{primes.inspect}"

prime_part_constructive(a, 1, [])
puts ""
