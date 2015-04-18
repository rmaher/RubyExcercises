class Encryptor
  def cipher(rotation)
    characters = (' '..'z').to_a
    rotated_characters = characters.rotate(rotation)
    Hash[characters.zip(rotated_characters)]
  end

  def encrypt_letter(letter,rotation)
    cipher_for_rotation = cipher(rotation)
    cipher_for_rotation[letter]
  end

  def encrypt(string,rotation)
    letters = string.split("")
    results = letters.collect { |letter| encrypt_letter(letter,rotation) }
    results.join
  end



  def encrypt_file(secrets,rotation)
    input = File.open("secrets.txt", "r")
    puts input.read.encrypt
    out = File.open("secrets.txt.encrypted", "w")
    puts input.write
    out.close
  end
end

class Decryptor

  def cipher(rotation)
    characters = (' '..'z').to_a
    rotated_characters = characters.rotate(rotation)
    Hash[characters.zip(rotated_characters)]
  end

  def decrypt_letter(letter,rotation)
    cipher_for_rotation = cipher(rotation)
    cipher_for_rotation[letter]
  end

  def decrypt(string,rotation)
    letters = string.split("")
    results = letters.collect { |letter| decrypt_letter(letter,rotation) }
    results.join
  end
end
