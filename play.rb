#TODO:
# Mostrar as palavras que já foram acertadas
# Bloquear letras já acertadas

class Hangman
  def initialize
    @word = words.sample
    @attempts = @word.first.size
    @word_preview = ""
    @word.first.size.times do
      @word_preview += "_ "
    end
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
  def print_preview last_try = nil
    update_preview(last_try) unless last_try.nil?
    puts @word_preview
  end

  def update_preview last_try
    new_preview = @word_preview.split

    new_preview.each_with_index do |letter, index|
      if letter == '_' && @word.first[index] == last_try
        new_preview[index] = last_try
      end
    end
    @word_preview = new_preview.join(' ')
  end

  #FIXME: O primeiro if do método trying ficou sem else, procurar saber se isso é um problema. Caso seja procurar saber como mudar.
  def trying
    if @attempts >= 1
      print "Digite uma letra: "
      try = gets.chomp
      tried = @word.first.include? try
      if tried
        puts "Acertou!"
        # Remove tentativas corretas do alfabeto
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