class Livro
	
	attr_reader :titulo, :preco, :ano_lancamento

	def initialize(titulo, preco, ano_lancamento, possui_reimpressao)

		@titulo = titulo
		@ano_lancamento = ano_lancamento
		@possui_reimpressao = possui_reimpressao
		@preco = calcula_preco(preco)
	end

	def calcula_preco(base)
		if @ano_lancamento < 2006
			if @possui_reimpressao
				base * 0.9
			else
				base * 0.95
			end
		elsif @ano_lancamento <= 2010
			base * 0.96
		else
			base
		end
	end

	def possui_reimpressao?
		@possui_reimpressao
	end
end

def livro_para_newsletter(livro)

	if livro.ano_lancamento < 1999
		puts "Newsletter/Liquidação"
		puts livro.titulo
		puts livro.preco
		puts livro.possui_reimpressao?
	end
end

class Estoque
	attr_reader :livros 

	def initialize
		@livros = []
	end

	def exporta_csv
		@livros.each do |livro|
			puts "#{livro.titulo} - #{livro.ano_lancamento}"
		end
	end

	def mais_baratos_que(valor)
		@livros.select do |livro|
			livro.preco <= valor
		end
	end
end



algoritmos = Livro.new("Algoritmos", 100, 1998, true)
#livro_para_newsletter(algoritmos)
arquitetura = Livro.new("Introducao a arquitetura de software", 70, 2011, true)

estoque = Estoque.new
estoque.livros << algoritmos << arquitetura

estoque.livros << Livro.new("The pragmatic programmer", 100, 1999, true)
estoque.livros << Livro.new("Programming Ruby", 100, 2004, true)


estoque.exporta_csv

baratos = estoque.mais_baratos_que 80
baratos.each do |livro|
	puts livro.titulo
end