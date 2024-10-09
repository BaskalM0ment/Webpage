require 'sinatra'

# Function to generate a random alphanumeric character
def get_random_char
  random_type = rand(3)

  case random_type
  when 0
    # Generate a random digit (0-9)
    rand(0..9).to_s
  when 1
    # Generate a random uppercase letter (A-Z)
    ('A'..'Z').to_a.sample
  else
    # Generate a random lowercase letter (a-z)
    ('a'..'z').to_a.sample
  end
end

# Function to generate a random alphanumeric string
def generate_random_string(length)
  random_string = ''
  length.times do
    random_string += get_random_char
  end
  random_string
end

# Route to display the web page
get '/' do
  erb :index
end

# Route to generate and display random string
post '/generate' do
  length = params[:length].to_i
  @random_string = generate_random_string(length)
  erb :index
end
