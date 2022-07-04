#IF
puts 'Digite um numero: '
x = gets.chomp.to_i
if x > 2
    puts 'x é maior que 2.'
else
    puts 'x é menor que 2.'
end

#UNLESS
puts 'Digite um numero: '
x = gets.chomp.to_i
unless x >= 2
    puts 'x é menor que 2.'
else
    puts 'x é maior que 2.'
end

#CASE
puts 'Digite uma idade: '
idade = gets.chomp.to_i

case idade
    when 0..2
        puts "bebê"
    when 3..12
        puts "criança"
    when 13..18
        puts "adolescente"
    else
        puts "adulto"
    end    
    
#ESTRUTURA CONDICIONAL TERNÁRIA
puts 'Digite a primeira letra do seu gênero'
sexo = gets.chomp.to_s

puts (sexo == 'M' ? 'Masculino' : 'Feminino')
