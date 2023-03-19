require 'date'

class Meetup
  SCHEDULE_LOOKUP = {
    'first' => 0,
    'second' => 1,
    'third' => 2,
    'fourth' => 3,
    'fifth' => 4,
    'last' => -1,
    'teenth' => 0
  }.freeze

  def initialize(year, month)
    @days = Date.new(year, month, 1).step(Date.new(year, month, -1))
  end

  def day(weekday, schedule)
    weekday.downcase!
    schedule.downcase!

    unless Date::DAYNAMES.include?(weekday.capitalize)
      raise ArgumentError, 'Must enter a valid week name.'
    end

    unless SCHEDULE_LOOKUP.keys.include?(schedule)
      raise ArgumentError, 'Must enter a valid schedule.'
    end

    days = schedule == 'teenth' ? @days.to_a[12..18] : @days

    days.select(&"#{weekday}?".to_sym)[SCHEDULE_LOOKUP[schedule]]
  end
end
