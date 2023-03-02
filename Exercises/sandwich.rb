class TextAnalyzer
  def process
    text = File.new("./sample1.txt", "r") 
    yield(text.read.split("\n")) if block_given?
    text.close
  end
end

analyzer = TextAnalyzer.new
analyzer.process { |text| puts "#{text.select(&:empty?).size + 1} paragraphs"   }
analyzer.process { |text| puts "#{text.size} lines" }
analyzer.process { |text| puts "#{text.join(" ").split.size} words"}