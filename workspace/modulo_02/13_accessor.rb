class Pessoa
    attr_accessor :nome
end

p1 = Pessoa.new
p1.nome = "angelo" #setter
p1.nome = "joao" #setter
p1.nome = "jose" #setter
p1.nome = "maria" #setter
puts p1.nome #getter