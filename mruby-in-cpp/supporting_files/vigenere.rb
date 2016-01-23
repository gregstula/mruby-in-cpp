# Copyright (c) 2016, Greg D. Stula
# All rights reserved.
# 
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are met:
# 
# * Redistributions of source code must retain the above copyright notice, this
#   list of conditions and the following disclaimer.
# 
# * Redistributions in binary form must reproduce the above copyright notice,
#   this list of conditions and the following disclaimer in the documentation
#   and/or other materials provided with the distribution.
# 
# * Neither the name of vigenere.rb nor the names of its
#   contributors may be used to endorse or promote products derived from
#   this software without specific prior written permission.
# 
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
# AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
# IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
# DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
# FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
# DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
# SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
# CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
# OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
# OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

class Key
  # Hashes for maping letters to alphabet numbers
  @@low_alpha = Hash[("a".."z").to_a.zip((0..25)).to_a]
  @@up_alpha = Hash[("A".."Z").to_a.zip((0..25)).to_a]

  def initialize(potential_key)
    @potential_key = potential_key
    @valid_key = ''
  end

  # checks if key is valid using upper lower hashes
  def not_valid?
    test = @potential_key.split('')

    test.each do |check|
      if @@low_alpha[check].nil? && @@up_alpha[check].nil?
        @result = true
        break
      else 
        @result = false
        @valid_key = @potential_key
      end
    end

    @result
  end

  # gets shift value from hash, and creates array of shift keys
  def get_shift
    find_shift = @valid_key.split('')
    @shift = []

    find_shift.each do |a|
      # a is lower case
      if a == a.downcase 
        num = @@low_alpha[a] 
        @shift.push(num)
      # if a is upper case
      elsif a == a.upcase
        num = @@up_alpha[a] 
        @shift.push(num)
      else
        puts 'Error: something unexpected happened.'
      end
    end
    @shift
  end
end

# modified caesar's cipher code that uses the
# keys in the array made by calling get_shift

def vigenere(key, txt)
  shift_array = key.get_shift
  count = 0

  txt_array = txt.split('')
  ciph=[]

  txt_array.each do |a|
    a = a.ord
    shift = shift_array[count % shift_array.size]
      case a
      when (64..90) 
        new_char = ((a - 64 + shift) % 26) + 64 
        count += 1
      when (97..122)
        new_char = ((a- 97 + shift) % 26) + 97
        count += 1
      else 
        new_char = a 
      end
      ciph.push(new_char.chr)
  end

  ciph = ciph.join('')
  puts "#{ciph}"
end

argc = ARGV.length

# ARGV objects are frozen!
# Dup vs. Clone
# Clone copies (and ARGV[0].to_s) the object's entire state, including frozen status.
# Dup copies the meat of the object without those other flags. 
# So we .dup to get our String key.

# rejects argc != 1 and non alpha key
if argc != 1 || ARGV == nil
  puts "Usage: ruby vigenere.rb [key]"
else
  arg_dup = ARGV[0].dup
  key = Key.new(arg_dup)

   if key.not_valid?
    puts "Invalid key! Must be alphabetical."
  else
    txt = gets.chomp
    vigenere(key, txt)
  end
end

