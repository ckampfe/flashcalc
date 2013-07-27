
def prompt()
  print "> "
end # ask which calculation: exposure distance or minimum aperture


def menu()
  puts "Which would you like to do:"
  puts "1. Get max. distance to subject"
  puts "2. Get minimum aperture"
 
  prompt; choice = STDIN.gets.chomp
  if choice == "1"
    calc_distance
  elsif choice == "2"
    calc_aperture
  else
    puts "Try again."
    menu
  end
end

# calculate acceptable distance to achieve proper exposure at a given aperture, GN, and ISO.
def calc_distance()
  puts "GN?"; prompt 
  gn = STDIN.gets.chomp.to_i
  puts "Aperture?"; prompt
  ap = STDIN.gets.chomp.to_i
  puts "ISO?"; prompt
  iso = STDIN.gets.chomp.to_i
end

# calculate the minimum aperture to achieve proper exposure at a given distance with a given ISO and GN.
# At this point all values given are for flash at 1/1 power
def calc_aperture()
  puts "GN?"; prompt 
  gn = STDIN.gets.chomp.to_i
  puts "Approximate distance to subject? (ft)"; prompt
  dist = STDIN.gets.chomp.to_i
  puts "ISO?"; prompt
  iso = STDIN.gets.chomp.to_i
  
  # transmute ISO value into something useful (raw stops) 
  iso_modifier = Math.log(iso/100, 2) 
  puts "ISO modifier is #{iso_modifier} stops"
  
  # calculate aperture using ISO modifier instead of base ISO 100
  # ap_test = gn / dist
  # puts "iso 100 value = #{ap_test}"
  ap = (gn / dist) * ((2 ** 0.5) ** iso_modifier)
  puts "Aperture: f#{ap.round(1)}, ISO #{iso}, GN: #{gn}, Distance (ft): #{dist}"

end



puts menu()
