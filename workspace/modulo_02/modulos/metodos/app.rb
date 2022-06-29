require_relative 'pagamento'

include Pagamento

puts "Digite a bandeira do cartão: "
bandeira_cartao = gets.chomp

puts "Digite o número do cartão: "
numero_cartao = gets.chomp

puts "Digite o valor a ser pago: "
valor_enviado = gets.chomp

puts pagar(bandeira_cartao, numero_cartao, valor_enviado)
puts Pagamento::pagar(bandeira_cartao, numero_cartao, valor_enviado)