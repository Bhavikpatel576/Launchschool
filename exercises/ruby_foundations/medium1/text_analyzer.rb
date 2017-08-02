class TextAnalyzer
	def process
		f = File.open("sample.txt",'r')
		yield(f.read)
		f.close
	end
end

analyzer = TextAnalyzer.new
analyzer.process { |text| puts "#{text.split("\n\n").count} paragraphs"}
analyzer.process { |text| puts "#{text.count("\n")} lines"}
analyzer.process { |text| puts "#{text.split(" ").count} words"}
