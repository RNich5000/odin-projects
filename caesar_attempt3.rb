def caesar(string, shift)
  # a hash of lower-case letters
  alphabet = Array("a".."z")
  lower_case = Hash[alphabet.zip(alphabet.rotate(shift))]

  # a hash of upper-case letters
  alphabet = Array("A".."Z")
  upper_case = Hash[alphabet.zip(alphabet.rotate(shift))]

  # a hash that merges the upper- and lower- case letters
  encryptor = lower_case.merge(upper_case)

  # fetch the encrypted letters and maps them over the unencrypted letters
  string.chars.map { |key| encryptor.fetch(key, key) }
end

puts "Enter your message:"
message = gets.chomp
puts "Enter your numerical cipher key:"
key = gets.chomp.to_i
puts "====="
puts caesar(message, key).join
