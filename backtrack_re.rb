class BacktrackRe
  class << self
    def match(re_str, str)
      if re_str[0] ==  "^"
        return matchhere(re_str[1..-1], str)
      end

      begin
        return true if matchhere(re_str, str)
        str = str[1..-1]
      end while str != ""

      false
    end

    def matchhere(re_str, str)
      return true                                     if re_str    == ""
      return matchstar(re_str[0], re_str[2..-1], str) if re_str[1] == "*"
      return str == ""                                if re_str    == "$"
      if (str != "") && (re_str[0] == "." || re_str[0] == str[0])
        return matchhere(re_str[1..-1], str[1..-1])
      end
      false
    end

    def matchstar(ch, re_str, str)
      while true
        return true if matchhere(re_str, str)
        break if str == ""
        break if str[0] != ch && ch != "."
        str = str[1..-1]
      end
      false
    end
  end
end
