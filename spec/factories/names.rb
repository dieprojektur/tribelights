
Factory.define :name do |f|
  f.first  'Jack'
  f.last  'Doe'
end

Factory.define :valid_name, :class =>Name do |f|
  f.first  'Jack'
  f.last  'Doe'
end
