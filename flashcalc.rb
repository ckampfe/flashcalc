def prompt()
  print "> "
end # ask which calculation: exposure distance or minimum aperture


def menu()
  puts "Which would you like to do:"
  puts "1 :: Get max. distance to subject"
  puts "2 :: Get minimum aperture"
 
  prompt; choice = STDIN.gets.chomp
  if choice == "1"
    calc_distance
  elsif choice == "2"
    calc_aperture
  else
    puts "\n\nTry again. Please choose 1 or 2."
    menu
  end
end


# calculate acceptable distance to achieve proper exposure at a given aperture, GN, and ISO.
def calc_distance()
  puts "GN?"; prompt 
  gn = STDIN.gets.chomp.to_i
  puts "Aperture? (f-number)"; prompt
  ap = STDIN.gets.chomp.to_f
  puts "ISO?"; prompt
  iso = STDIN.gets.chomp.to_i
  puts "Flash power setting? (1/1, 1/4, etc.)"; prompt
  fp = STDIN.gets.chomp.to_r.to_f
  
  # transmute ISO, aperture, and flash power into something useful (raw stops) 
  iso_mod = -(Math.log(iso/100.0, 2)) 
  fp_mod = Math.log(fp**(-1.0), 2)
  ap_mod = Math.log(ap, (2**0.5))

  # combine individual stops into total ev
  ev = ((2 ** 0.5) ** (iso_mod + ap_mod + fp_mod))
   
  # calculate maximum distance to achieve proper exposure given aperture (f-number), ISO, and GN
  dist = (gn / ev) 
  puts "Distance: #{dist.round}ft @ f#{ap.round(2)}, ISO #{iso}, FP #{fp}, GN #{gn}"
end


# calculate the minimum aperture to achieve proper exposure at a given distance with a given ISO and GN.
def calc_aperture()
  puts "GN?"; prompt 
  gn = STDIN.gets.chomp.to_i
  puts "Approximate distance to subject? (ft)"; prompt
  dist = STDIN.gets.chomp.to_f
  puts "ISO?"; prompt
  iso = STDIN.gets.chomp.to_i
  puts "Flash power setting? (1/1, 1/4, etc.)"; prompt
  fp = STDIN.gets.chomp.to_r.to_f 

  # transmute ISO and flash power into something useful (raw stops) 
  iso_mod = Math.log(iso/100.0, 2)
  fp_mod = -(Math.log(fp**(-1.0), 2))
 
  # combine individual stops into total ev 
  ev = ((2 ** 0.5) ** (iso_mod + fp_mod))
   
  # calculate aperture using ISO modifier instead of base ISO 100
  # ap_test = gn / dist
  # puts "iso 100 value = #{ap_test}"
  ap = ((gn / dist) * ev) 
  puts "Minimum aperture: f#{ap.round(1)} @ ISO #{iso}, FP #{fp}, GN #{gn}, #{dist}ft"
end


puts menu()
