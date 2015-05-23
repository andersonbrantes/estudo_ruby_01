class Livro
	
	attr_reader :titulo, :preco, :ano_lancamento

	def initialize(titulo, preco, ano_lancamento)

		@titulo = titulo
		@preco = preco
		@ano_lancamento = ano_lancamento
	end
end


livro_rails = Livro.new("Agile Web Development With Rails", 70, 2011)

livro_ruby = Livro.new("Programing Ruby 1.9", 60, 2010)

def imprime_nota_fiscal(livros)

	livros.each do |livro|
		puts "Titulo: #{livro.titulo} - Preço: #{livro.preco}"
	end
end


livros = [livro_rails, livro_ruby]

imprime_nota_fiscal livros