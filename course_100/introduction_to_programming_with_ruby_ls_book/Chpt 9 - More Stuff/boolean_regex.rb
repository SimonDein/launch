# Example of using regex as a boolean

def has_a_b (str)
  if str =~ /b/
    puts "'#{str.capitalize}' contains a b!"
  else
    puts "There's no b in '#{str}'."
  end
end

has_a_b("skateboarding")
has_a_b("hard rock")
has_a_b("hibernate")
