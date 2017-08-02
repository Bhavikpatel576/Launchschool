
ENCRYPTED_PIONEERS = [
  'Nqn Ybirynpr',
  'Tenpr Ubccre',
  'Nqryr Tbyqfgvar',
  'Nyna Ghevat',
  'Puneyrf Onoontr',
  'Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv',
  'Wbua Ngnanfbss',
  'Ybvf Unvog',
  'Pynhqr Funaaba',
  'Fgrir Wbof',
  'Ovyy Tngrf',
  'Gvz Orearef-Yrr',
  'Fgrir Jbmavnx',
  'Xbaenq Mhfr',
  'Fve Nagbal Ubner',
  'Zneiva Zvafxl',
  'Lhxvuveb Zngfhzbgb',
  'Unllvz Fybavzfxv',
  'Tregehqr Oynapu'
].freeze

def rot13(encrypted_text)
  encrypted_text.each_char.reduce('') do |result, encrypted_char|
  	puts result
  	puts encrypted_char
    result + decipher_character(encrypted_char)
  end
end

def decipher_character(encrypted_char)
  case encrypted_char
  when 'a'..'m', 'A'..'M' then (encrypted_char.ord + 13).chr
  when 'n'..'z', 'N'..'Z' then (encrypted_char.ord - 13).chr
  else                         encrypted_char
  end
end

def rot(string)
	alph1 = ('a'..'z').to_a
	alph2 = ('A'..'Z').to_a
	new_string = string.chars.map do |char|
		if alph1.include?(char)
			i = alph1.index(char)
			idx = (i + 13) % 26
			alph1.fetch(idx)
		elsif alph2.include?(char)
			i = alph2.index(char)
			idx = (i + 13) % 26
			alph2.fetch(idx)
		else
			char
		end
	end
	new_string.join("")
end


ENCRYPTED_PIONEERS.each do |encrypted_name|
  puts rot13(encrypted_name)
  puts rot(encrypted_name)
  exit
end