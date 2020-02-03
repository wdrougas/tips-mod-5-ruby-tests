require 'active_support'
require 'active_support/core_ext'
require 'pry'

class RecurringMoment
  #every instance of a recurring moment has a start, an interval, and a period
  #the instance variable of start would be a date i believe
  #the instance variable of interval would be an amount of time, such as 1 day, 1 week, or 1 month
  #the period would be how frequently this moment reoccurs. Daily, monthly, or weekly 
  #lunch_with_mom = RecurringMoment.new(start: jan1, interval: 1 , period: 'weekly')
  #lunch_with_mom.match(start: jan1.advance(weeks: 1)).to eq true
  def initialize(start:, interval:, period:)
    @start = start
    @interval = interval
    @period = period
  end

  #instance method for an instance of RecurringMoment. Takes in one argument of a date and based on the date determines if it is a match
  def match(date)
    current = @start
    p self 
    p date
    counter = 1
    
    while current <= date
      if current == date
        return true
      end
     p "current", current


      if @period == 'monthly' 
        current = @start.advance(months: counter * @interval)
        counter += 1
      elsif @period == 'weekly'
        current = current.advance(weeks: @interval)
        #here we need the interval to be a multiple of the start value. If we have a 2 day recurring moment, we need to return false for an interval of a week or an odd number of days
      #elsif @period == 'daily' && current % @interval == 0
      #current.strftime('%D') = current.advance(days: @interval)
      elsif @period == 'daily'
        current = current.advance(days: @interval)
      end
    end

    return false
  end
end
