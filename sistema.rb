require_relative "livro"
require_relative "estoque"

def livro_para_newsletter(livro)

	if livro.ano_lancamento < 1999
		puts "Newsletter/Liquidação"
		puts livro.titulo
		puts livro.preco
		puts livro.possui_reimpressao?
	end
end


estoque = Estoque.new
algoritmos = Livro.new("Algoritmos", 100, 1998, true)

estoque << algoritmos

puts estoque.maximo_nescessario

arquitetura = Livro.new("Introducao a arquitetura de software", 70, 2011, true)
programmer = Livro.new("The pragmatic programmer", 100, 1999, true)
ruby = Livro.new("Programming Ruby", 100, 2004, true)


estoque = Estoque.new
estoque << algoritmos << arquitetura << programmer << ruby

puts estoque.maximo_nescessario

estoque.remove algoritmos

puts estoque.maximo_nescessario