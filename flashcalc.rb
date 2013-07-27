def prompt()
  print "> "
end

# ask which they want to calculate: exposure distance or minimum aperture
def menu()
  puts "Which would you like to do:"
  puts "1. Get distance to subject"
  puts "2. Get minimum aperture"
 
  prompt; choice = STDIN.gets.chomp
  if choice == "1"
    calc_distance
  elsif choice.include? "2"
    calc_aperture
  else
    puts "Try again."
    menu
  end
    

end

# calculate acceptable distance to achieve proper exposure at a given aperture
def calc_distance()
  puts "GN?"; prompt 
  gn = STDIN.gets.chomp.to_i
  puts "Aperture?"; prompt
  ap = STDIN.gets.chomp.to_i
  puts "ISO?"; prompt
  iso = STDIN.gets.chomp.to_i

end

# calculate the minimum aperture to achieve proper exposure at a given distance
def calc_aperture()
  puts "GN?"; prompt 
  gn = STDIN.gets.chomp.to_i
  puts "Distance?"; prompt
  dist = STDIN.gets.chomp.to_i
  puts "ISO?"; prompt
  iso = STDIN.gets.chomp.to_i
  
end



puts menu()
