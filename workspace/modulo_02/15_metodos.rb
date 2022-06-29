class Pessoa
    def falar #metodo de instancia / precisa instaciar
        "Olá!"
    end
    def self.gritar(texto) #metodo de classe / NÃO precisa instanciar
        "#{texto}!!!!"
    end
end

p1 = Pessoa.new
puts p1.falar

puts Pessoa.gritar("OLÁ")