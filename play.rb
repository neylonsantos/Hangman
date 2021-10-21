#TODO:
# Mostrar as palavras que já foram acertadas
# Bloquear letras já acertadas

class Hangman
  def initialize
    @letters = ('a'..'z').to_a
    @word = words.sample
    @attempts = @word.first.size
    @right_try = []
  end

  # Palavras que serão utilizadas no jogo
  def words
    [
      ["academia", "Lugar para ganhar músculos"],
      ["girafa", "Animal da savana africana"],
      ["geladeira", "Eletrodomestico"]
    ]
  end

  # Mostra a quantidade de letras da palavra e também as letras já acertadas.
  def print_preview
    word_preview = ""
    @word.first.size.times do
      word_preview += "_ "
    end
    puts word_preview
  end

  #FIXME: O primeiro if do método trying ficou sem else, procurar saber se isso é um problema. Caso seja procurar saber como mudar.
  def trying
    if @attempts >= 1
      print "Digite uma letra: "
      try = gets.chomp
      tried = @word.first.include? try
      if tried
        puts "Acertou!"
        @right_try << try
        print_preview
        trying
      else
        @attempts -= 1
        if @attempts == 1
          puts "Errou! esta é sua ultima chance, tente novamente com cuidado."
          trying
        elsif @attempts>= 2
          puts "Errou! Você ainda tem #{@attempts} chances, tente novamente."
          trying
        else
          puts "Você perdeu :( Mais sorte na próxima vez!"
        end
      end
    end
  end

  # Método que inicia o jogo
  def perform
    puts "O jogo começou, a palavra tem #{@word.first.size} letras"
    print_preview
    puts "Dica: #{@word.last}"
    trying
  end
end

game = Hangman.new
game.perform