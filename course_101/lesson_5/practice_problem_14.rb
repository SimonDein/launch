# Given this data structure write some code to return an array containing the colors of the fruits -
# and the sizes of the vegetables. The sizes should be uppercase and the colors should be capitalized.

hsh = {'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
  'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
  'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
  'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
  'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
}

new_arr = hsh.map do |object|
  object_details = object[1]
  type = object_details[:type]
  colors = object_details[:colors]
  size = object_details[:size]

  if type == 'fruit'
    colors.map { |color| color.capitalize}
  else
    size.upcase
  end
end # => [["Red", "Green"], "MEDIUM", ["Red", "Green"], ["Orange"], "LARGE"]
