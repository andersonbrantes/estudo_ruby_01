class Livro
	
	attr_reader :titulo, :preco, :ano_lancamento

	def initialize(titulo, preco, ano_lancamento, possui_reimpressao)

		@titulo = titulo
		@ano_lancamento = ano_lancamento
		@possui_reimpressao = possui_reimpressao
		@preco = calcula_preco(preco)
	end

	def to_csv
		"#{@titulo} - #{@ano_lancamento} - #{@preco}"
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
		def @livros.<<(livro)
			push(livro)
			if @maximo_nescessario.nil? || @maximo_nescessario < size
				@maximo_nescessario = size
			end
			self
		end

		def @livros.maximo_nescessario
			@maximo_nescessario
		end
	end

	def exporta_csv
		@livros.each do |livro|
			puts livro.to_csv
		end
	end

	def mais_baratos_que(valor)
		@livros.select do |livro|
			livro.preco <= valor
		end
	end

	def total
		@livros.size
	end

	def adiciona(livro)
		@livros << livro if livro
	end
end


estoque = Estoque.new
algoritmos = Livro.new("Algoritmos", 100, 1998, true)

estoque.livros << algoritmos

puts estoque.livros.maximo_nescessario

arquitetura = Livro.new("Introducao a arquitetura de software", 70, 2011, true)
programmer = Livro.new("The pragmatic programmer", 100, 1999, true)
ruby = Livro.new("Programming Ruby", 100, 2004, true)


estoque = Estoque.new
estoque.livros << algoritmos << arquitetura << programmer << ruby

puts estoque.livros.maximo_nescessario

estoque.livros.delete algoritmos

puts estoque.livros.maximo_nescessario