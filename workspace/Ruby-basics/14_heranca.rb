class Pessoa
    attr_accessor :nome, :email
end

class PessoaFisica < Pessoa
    attr_accessor :CPF

    def falar(texto)
        texto
    end
end

class PessoaJuridica < Pessoa
    attr_accessor :CNPJ

    def pagar_fornecedor
        "Fornecedor pago."
    end
end

#---------------------------

#setter
p1 = Pessoa.new
p1.nome = "angelo"
p1.email = "angeloagatz@gmail.com"
#getter
puts p1.nome
puts p1.email
puts "*-----------------------------------------------*"

#--------------------------------

#setter
p2 = PessoaFisica.new
p2.nome = "joao"
p2.email = "joao@gmail.com"
p2.CPF = "26468421345"
#getter
puts ("Nome: #{p2.nome}")
puts ("E-mail: #{p2.email}")
puts ("CPF: #{p2.CPF}")
puts p2.falar("Hi!")
puts "*-----------------------------------------------*"

#--------------------------------

#setter
p3 = PessoaJuridica.new
p3.nome = "Empresa"
p3.email = "empresa@empresa.com"
p3.CNPJ = "264684214-000175"
#getter
puts ("Nome: #{p3.nome}")
puts ("E-mail: #{p3.email}")
puts ("CNPJ: #{p3.CNPJ}")
puts p3.pagar_fornecedor
puts "*-----------------------------------------------*"

#--------------------------------


