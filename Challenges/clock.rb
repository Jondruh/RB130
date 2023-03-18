=begin
PROCESS
create a clock object that holds the time. 
all operation use the class method #at
#at takes two arguments, hour and mins. Minutes are optional and default to 0
  returns a clock object.

clock object should return "hh:mm" formatted strings when they call #to_s

we should be able to add and subtract time from a clock object. These operation should not
mutate the original object but return a new clock object

two clock objects should compare their times to determine equality 
  so define a clock==(other_clock) method.

argument checking to make sure legal time? or time wrap? 24 or 12 hour?
24h clock.
  should wrap minutes and hours

method Subtraction(minutes to subtract)
  convert time to total minutes
  subtract minutes from total time minutes
  if above step is negative
    subtract the below normalized result from 1440
  normalize the result
    norm minutes = 1440 % minutes
  convert back to hours and minutes
  
=end

class Clock
  def initialize(hour, min)
    @hour = hour.to_i
    @min = min.to_i
  end

  def to_s
    sprintf("%02d:%02d", @hour, @min)
  end

  def +(time)
    Clock.new(*addition(time.to_i))
  end

  def -(time)
    Clock.new(*subtraction(time.to_i))
  end

  def self.at(hour, min = 0)
    Clock.new(hour, min)
  end

  def ==(other_clock) 
    (@hour == other_clock.hour &&
    @min == other_clock.min)
  end

  protected
  attr_reader :hour, :min

  private

  def subtraction(time)
    time_in_minutes = total_minutes

    time_in_minutes -= time
    normalized_min = time_in_minutes.abs % 1440
    if time_in_minutes < 0
      time_in_minutes = 1440 - normalized_min
    end

    total_min_to_hours(time_in_minutes)
  end

  def addition(time)
    time_in_minutes = total_minutes

    time_in_minutes += time
    normalized_min = time_in_minutes % 1440

    total_min_to_hours(normalized_min)
  end

  def total_minutes
    (@hour * 60) + @min
  end

  def total_min_to_hours(min)
    min.divmod(60)
  end
end

