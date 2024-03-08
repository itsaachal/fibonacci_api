class FibonacciService

  # to check if a number is prime
  def self.is_prime(num)
    return false if num <= 1

  # Check for divisors from 2 to the square root of num
  (2..Math.sqrt(num).to_i).none? { |i| (num % i).zero? }
  end

  # to find Fibonacci prime number with a specified length
  def self.find_fibonacci_prime_with_length(target_length)
    sequence = [0, 1]

    sequence << sequence[-1] + sequence[-2] until sequence.last.to_s.length == target_length && is_prime(sequence.last)
    sequence.last
  end

  # Filter Fibonacci numbers based on whether they are prime and within the specified range
  def self.find_fibonacci_primes_in_range(range)
    fib_sequence = [0, 1]
    fib_primes = []

    while true
      next_fib = fib_sequence[-1] + fib_sequence[-2]
      break if next_fib > range.last

     fib_primes << next_fib if is_prime(next_fib) && (range.first..range.last).include?(fib_sequence.length)
      fib_sequence << next_fib
    end

    fib_primes
  end
end
