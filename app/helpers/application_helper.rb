module ApplicationHelper
	def getQuarterByMonth(month)
		monthname = month.gsub(/\d+/,"")
		n = Date::MONTHNAMES.index monthname
	  return ((n-1)/3)+1
	end
end
