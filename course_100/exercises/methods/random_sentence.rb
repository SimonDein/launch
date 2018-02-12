

names = ['Dave', 'Sally', 'George', 'Jessica']
activities = ['walking', 'running', 'cycling']

def name(arr)
  arr[rand(arr.length)]
end

def activity(arr)
  arr[rand(arr.length)]
end

def sentence(name, activity)
  "#{name} went #{activity} today!"
end


puts sentence(name(names), activity(activities))
