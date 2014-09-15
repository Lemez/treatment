require 'date'
require 'awesome_print'

DATES = []

away_period_1 = Date.parse('06 October 2014')
away_period_2 = Date.parse('12 November 2014')
away_length_1 = 10
away_length_2 = 7

i = 0
while i < away_length_1
	DATES << away_period_1 + i
	i+=1
end

i = 0
while i < away_length_2
	DATES << away_period_2 + i
	i+=1
end


DATES.each{|d| p d.strftime('%a %d %b %Y')}

possible_dates = {}

last = Date.parse('25 August 2014')
a = last + 28
sonography_first_possible = a + 5
sonography_last_possible = a + 12
norethisterone_start = a + 13
nasal_start = a + 20
norethisterone_last = a + 24
b_possibles = [norethisterone_last + 3, norethisterone_last + 4, norethisterone_last + 5, norethisterone_last + 6, norethisterone_last + 7]
b_possibles.each do |poss|
	scan_oestrogen = [(poss + 1).strftime('%a %d %b %Y'), (poss + 2).strftime('%a %d %b %Y'), (poss + 3).strftime('%a %d %b %Y')] 
	scan_check = [(poss + 7).strftime('%a %d %b %Y')]
	scan_prog = [(poss + 11).strftime('%a %d %b %Y'), (poss + 12).strftime('%a %d %b %Y')]
	transfer_week = [(poss+12).strftime('%a %d %b %Y'),
					 (poss+13).strftime('%a %d %b %Y'),
					 (poss+14).strftime('%a %d %b %Y'),
					 (poss+15).strftime('%a %d %b %Y'),
					 (poss+16).strftime('%a %d %b %Y'),
					 (poss+17).strftime('%a %d %b %Y'),
					 (poss+18).strftime('%a %d %b %Y')]
	first_dates = {
		:sonography_first_possible => sonography_first_possible.strftime('%a %d %b %Y'),
		:sonography_last_possible => sonography_last_possible.strftime('%a %d %b %Y'),
		:norethisterone_starts => norethisterone_start.strftime('%a %d %b %Y'),
		:nasal_start => nasal_start.strftime('%a %d %b %Y'),
		:norethisterone_ends => norethisterone_last.strftime('%a %d %b %Y')
	}

	critical_dates = {
		:scan_and_start_oestrogen => scan_oestrogen,
		:check => scan_check,
		:progesterone => scan_prog,
		:transfer => transfer_week
	}
	period_day_1 = "Critical cycle starts: " + poss.strftime('%a %d %b %Y')

	possibilities = "Next period: " + a.strftime('%a %d %b %Y')
	possible_dates[possibilities] = first_dates
	possible_dates[period_day_1] = critical_dates
end

ap possible_dates




# last p ; 25 Aug = day 1
# every 28 days = next day 1

# 6-13: scan:sonography (any day this week) 
# 14: norethisterone
# 21: nasal spray
# 25: last norethisterone

# this could be 3,4,(5,6,7) days until day 1 again

# 1: call
# day  A 2,3 or 4: scan + start oestrogen
# A + 7: Scan
# A + 11/12: Scan + start prog
# A + 12-19: be around for et

# usage ruby calendar.rb ARGV 1 2 3 4

