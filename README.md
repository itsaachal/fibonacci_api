# README

# Fibonacci API

## Overview
Fibonacci API is a simple REST API designed to return prime numbers from the Fibonacci sequence within a specified range and length.

## Install dependencies:
   bundle install

Making Requests with cURL:

To retrieve Fibonacci prime numbers, you can use below curl with the following command:

# To calculate a Fibonacci number with a specific length:

curl -X GET "http://localhost:3000/fibonacci_prime?length=3"

# To find Fibonacci primes within a range:
curl -X GET "http://localhost:3000/fibonacci_prime?range[]=2&range[]=15"

# To find Fibonacci primes within a specified range and length:
curl -X GET "http://localhost:3000/fibonacci_prime?length=2&range[]=2&range[]=15"



## Testing

To run tests:

bundle exec rspec