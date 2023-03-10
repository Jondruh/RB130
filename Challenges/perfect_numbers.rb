class PerfectNumber
  def self.classify(num)
    raise StandardError if num < 1

    aliquot = divisors(num).sum

    case aliquot <=> num
    when 1 then "abundant"
    when 0 then "perfect"
    when -1 then "deficient"
    end

  end

  class << self
    private
    def divisors(num)
      1.upto(num - 1).with_object([]) do |count, divisors|
        divisors << count if num % count == 0
      end
    end
  end

end

