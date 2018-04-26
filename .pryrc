require 'base64'

def change_iterm_badge(str) 
  bstr = Base64.encode64(str)
  puts "\x1B]1337;SetBadgeFormat=#{bstr}\a"
end



