class KeyGenerator
  attr_reader :date

  def initialize(date = Time.now.strftime("%d%m%y"))
    @date = date
  end

  def generate_random_key(key)
    key = rand(99999).to_s
    key.rjust(5, "0")
    key.chars.each_cons(2).map(&:join)
  end

  def calculate_offset_from_date(date)
    date = date.to_i
    squared_total = (date ** 2)
    squared_total.to_s[-4..-1]
  end

  def set_shifts(key, date)
    generate_random_key(key)
    calculate_offset_from_date(date)
    @shifts << generate_random_key[0].to_i + calculate_offset_from_date[0].to_i
    @shifts << generate_random_key[1].to_i + calculate_offset_from_date[1].to_i
    @shifts << generate_random_key[2].to_i + calculate_offset_from_date[2].to_i
    @shifts << generate_random_key[3].to_i + calculate_offset_from_date[3].to_i
  end
end
