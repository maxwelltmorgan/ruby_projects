#Implement a caesar cipher that takes in a string and shift factor and then outputs the modified string:

def caesar_cipher(string, number)

alphabet_array = ('a'..'z').to_a
alphabet_array.unshift(" ")
string_in = string.split("")
string_out = []

string_in.each do |letter|

    letter_position = alphabet_array.index(letter.downcase)
    if letter == letter.upcase
        if letter == " "
            string_out.push(" ")
        else
            if (letter_position + number) > 26
                input_wrap_letter = alphabet_array[(letter_position + number) % 26]
                string_out.push(input_wrap_letter.upcase)
            else
                input_letter = alphabet_array[letter_position + number]
                string_out.push(input_letter.upcase)
            end
        end
    else
        if letter == " "
            string_out.push(" ")
        else
            if (letter_position + number) > 26
                input_wrap_letter = alphabet_array[(letter_position + number) % 26]
                string_out.push(input_wrap_letter)
            else
                input_letter = alphabet_array[letter_position + number]
                string_out.push(input_letter)
            end
        end
    end
end

puts string_out.join("")

end

caesar_cipher("A b C d E f G h I j K l M n O p", 25)
