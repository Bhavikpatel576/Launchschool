class Devise
	def initialize
		@recording = []
	end

	def record(recording)
		@recording << recording
	end

	def listen
		return unless block_given?
		record(yield)
	end

	def play
		puts @recording.last
	end
end

mp3_player = Devise.new
mp3_player.listen { "Hello world!"}
mp3_player.listen
mp3_player.play # Outputs 'Hello world!'