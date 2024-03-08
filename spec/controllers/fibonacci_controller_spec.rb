require 'rails_helper'

RSpec.describe FibonacciController, type: :controller do
  describe 'GET #index' do
    context 'with valid input' do
      let(:json_response) { JSON.parse(response.body) }

      it 'returns a JSON response with Fibonacci number when length is provided' do
        get :index, params: { length: 3 }
        expect(response).to have_http_status(:ok)
        expect(json_response).to have_key('fibonacci_number')
        expect(json_response['fibonacci_number'].to_s.length).to eq(3)
      end

      it 'returns a JSON response with Fibonacci range when range is provided' do
        get :index, params: { range: [2, 15] }
        json_response = JSON.parse(response.body)
        expect(response).to have_http_status(:ok)
        expect(json_response).to have_key('fibonacci_range')
        expect(json_response['fibonacci_range']).to include(2, 3, 5, 13)
      end

      it 'returns a JSON response with Fibonacci range when range and length is provided' do
        get :index, params: { range: [1, 5], length: 3 }
        expected_response = {
          'fibonacci_number' => json_response['fibonacci_number'],
          'fibonacci_range' => json_response['fibonacci_range']
        }
        expect(response).to have_http_status(:ok)
        expect(json_response).to eq(expected_response)
      end
    end

    context 'with invalid input' do
      it 'returns a JSON response with an error message' do
        get :index
        json_response = JSON.parse(response.body)

        expect(response).to have_http_status(:unprocessable_entity)
        expect(json_response).to have_key('error')
        expect(json_response['error']).to eq('Invalid input. Please provide "length" or "range" in the request.')
      end
    end
  end
end