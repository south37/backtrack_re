require './backtrack_re'

def print_match(re_str, str)
  print "re: /#{re_str}/ text: \"#{str}\" result: #{BacktrackRe.match(re_str, str)}\n"
end

print_match("^.*$", "ok")
print_match("^o*k$", "oook")
print_match("^o*k$", "ooo")
print_match("^o*.$", "ooo")
print_match("^o*$", "")
print_match("^o*$", "k")
# >> re: /^.*$/ text: "ok" result: true
# >> re: /^o*k$/ text: "oook" result: true
# >> re: /^o*k$/ text: "ooo" result: false
# >> re: /^o*.$/ text: "ooo" result: true
# >> re: /^o*$/ text: "" result: true
# >> re: /^o*$/ text: "k" result: false
