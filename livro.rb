class Livro
	
	attr_acessor :titulo, :preco, :ano_lancamento
end


livro_rails = Livro.new
livro_rails.preco = 70
livro_rails.titulo = "Agile Web Development With Rails"
livro_rails.ano_lancamento = 2011