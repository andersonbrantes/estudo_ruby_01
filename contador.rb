module Contador
	def <<(livro)
		push(livro)
		if @maximo_nescessario.nil? || @maximo_nescessario < size
			@maximo_nescessario = size
		end
		self
	end

	attr_reader :maximo_nescessario
end