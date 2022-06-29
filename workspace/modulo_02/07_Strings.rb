x = "angelo"
y = "rails"

puts x
puts y
puts x.class
puts y.class

a = "Curso"
b = "Rails"

puts a + b
puts a << b #joga o "b" para dentro de "a"

z = "curso"
puts z.object_id
z = z + "Rails"
puts z
puts z.object_id
##############
q = "curso de "
puts q.object_id
q << "rails"
puts q
puts q.object_id

########################

h = "Angelo #{1+1} Gatz #{q}"
puts h