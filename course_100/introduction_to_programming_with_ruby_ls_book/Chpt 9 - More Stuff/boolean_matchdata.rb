# Another version of boolean_regex.rb
# Example of using the MatchData object as a boolean

# The match method returns a MatchData object or 'nil'
# whereas the '=~' operator returns the index of the first match or nil

def has_a_b (str)
  if /b/.match(str)
    puts "'#{str.capitalize}' contains a b!"
  else
    puts "There's no b in '#{str}'."
  end
end

has_a_b("skateboarding")
has_a_b("hard rock")
has_a_b("hibernate")
