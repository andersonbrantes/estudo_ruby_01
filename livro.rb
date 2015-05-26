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
end

def livro_para_newsletter(livro)

	if livro.ano_lancamento < 1999
		puts "Newsletter/Liquidação"
		puts livro.titulo
		puts livro.preco
	end
end


algoritmos = Livro.new("Algoritmos", 100, 1998, true)
livro_para_newsletter(algoritmos)
