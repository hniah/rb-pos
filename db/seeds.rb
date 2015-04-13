puts '== Creating Admin =='
admin = Admin.find_by_email 'admin@example.com'
unless admin
  admin = Admin.create!(
      email: 'admin@example.com',
      password: '123123123'
  )
end
puts '== Finish creating Admin =='

puts '== Creating Location =='
if Location.all.count == 0
  Country.all.each do |name, iso_code|
    Location.create( name: name, iso_code: iso_code )
  end
end
puts '==Finish creating Location =='
