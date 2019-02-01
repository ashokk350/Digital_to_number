class InvoiceFile < ApplicationRecord
	has_many :invoice_numbers

	#Patterns based on given problem.
  NUMBER_FORMAT = {
  	'0' => " _ | ||_|",
  	'1' => "     |  |",
    '2' => " _  _||_ ",
    '3' => " _  _| _|",
    '4' => "   |_|  |",
    '5' => " _ |_  _|",
    '6' => " _ |_ |_|",
    '7' => " _   |  |",
    '8' => " _ |_||_|",
    '9' => " _ |_| _|"
  }

  def get_data(data)
  	output = '?'
  	data = data.split("\n\n")

  	data.each do |str|
  		str = str.split("\n")
  		lenght = str[0].length
  		index = 0 
  		output = ''
  		while index < lenght
  			#Making a pattern matching string from uploded file with NUMBER_FORMAT.
  			char_str = str[0][index..index+2] + str[1][index..index+2] + str[2][index..index+2]
  			output = get_output(char_str, output)
  			index += 3
  		end
  		illegal = output.include?('?') ? 'ILLEGAL' : ''
  		invoice_numbers.create(data: output, number_type: illegal)
  	end
  end

  def get_output(char_str, output)
  	count = 0
  	#Checking if any pattern match with NUMBER_FORMAT.
  	NUMBER_FORMAT.each do |key, value|
  		if value == char_str
  			output += key
  			count = 1
  			break
  		end
  	end
  	output += "?" if count == 0
  	output
  end
end
