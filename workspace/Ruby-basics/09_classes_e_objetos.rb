class Pessoa
    def initialize(cont = 1)
        cont.times do |i|
        puts "Inicializando... #{i}"
        end
    end
    
    def falar(nome = 'algum nome aqui.')
        "olá, #{nome}"
    end
end

p = Pessoa.new(5)
puts p.falar('angelo gatz')