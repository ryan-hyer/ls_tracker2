module ApplicationHelper
	def getQuarterByMonth(month)
		monthname = month.gsub(/\d+/,"")
		n = Date::MONTHNAMES.index monthname
	  return ((n-1)/3)+1
	end

  # 'Natural order' comparison of two strings, credit Alan Davies natcmp.rb
  def natcmp(str1, str2, caseInsensitive=false)
    str1, str2 = str1.dup, str2.dup
    compareExpression = /^(\D*)(\d*)(.*)$/

    if caseInsensitive
      str1.downcase!
      str2.downcase!
    end

    # Remove all whitespace
    str1.gsub!(/\s*/, '')
    str2.gsub!(/\s*/, '')

    while (str1.length > 0) or (str2.length > 0) do
      # Extract non-digits, digits and rest of string
      str1 =~ compareExpression
      chars1, num1, str1 = $1.dup, $2.dup, $3.dup

      str2 =~ compareExpression
      chars2, num2, str2 = $1.dup, $2.dup, $3.dup

      # Compare the non-digits
      case (chars1 <=> chars2)
        when 0 # Non-digits are the same, compare the digits...
          # If either number begins with a zero, then compare alphabetically,
          # otherwise compare numerically
          if (num1[0] != 48) and (num2[0] != 48)
            num1, num2 = num1.to_i, num2.to_i
          end

          case (num1 <=> num2)
            when -1 then return -1
            when 1 then return 1
          end
        when -1 then return -1
        when 1 then return 1
      end # case

    end # while

    # Strings are naturally equal
    return 0
  end

end
