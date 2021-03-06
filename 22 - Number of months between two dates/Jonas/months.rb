require 'date'

def months_differance( start_month:, end_month: )
  non_fractional_months = end_month - start_month - 1

  return [ non_fractional_months, 0 ].max
end

def start_fraction_of_month( date: )
  last_day_of_dates_month = Date.new( date.year, date.month, -1 ).day
  dates_fraction = ( 1 + last_day_of_dates_month - date.day ).to_f / last_day_of_dates_month

  return dates_fraction
end

def end_fraction_of_month( date: )
  last_day_of_dates_month = Date.new( date.year, date.month, -1 ).day
  dates_fraction = date.day.to_f / last_day_of_dates_month

  return dates_fraction
end

def months( start_date:, end_date: )
  years_differance = end_date.year - start_date.year
  whole_months_differance = months_differance( start_month: start_date.month, end_month: end_date.month )

  if( start_date.month == end_date.month )
    start_dates_fraction = start_fraction_of_month( date: start_date ) - ( 1.0 - end_fraction_of_month( date: end_date ))
    end_dates_fraction = 0.0
  else
    start_dates_fraction = start_fraction_of_month( date: start_date )
    end_dates_fraction = end_fraction_of_month( date: end_date )
  end

  total = ( years_differance * 12 ) + whole_months_differance + start_dates_fraction + end_dates_fraction

  return total.round(2)
end
