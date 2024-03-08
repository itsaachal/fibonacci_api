class FibonacciController < ApplicationController

  def index
    target_length = params['length'].to_i
    target_range = params['range'].map(&:to_i) if params['range']

    result = {}

    # Calculate Fibonacci prime numbers with a specified length if length is provided
    result["fibonacci_number"] = FibonacciService.find_fibonacci_prime_with_length(target_length) if target_length != 0

    # Calculate Fibonacci prime numbers within a specified range if range is provided
    result["fibonacci_range"] = FibonacciService.find_fibonacci_primes_in_range(target_range) if target_range

    if result.empty?
      render json: { error: 'Invalid input. Please provide "length" or "range" in the request.' }, status: :unprocessable_entity
    else
      render json: result
    end
  end
end
