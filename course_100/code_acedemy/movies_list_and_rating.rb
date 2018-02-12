# hash containing movie titles along with rating
movies = {
    kill_bill_vol_1: 3,
    gangs_of_new_york: 4,
    a_guide_to_recognizing_your_saints: 3,
    big_hero_6: 3,
    district_9: 3,
}

# ask user for which action is wanted
puts "What would you like to do?\nActions: 'add', 'update', 'display', 'delete'"
choice = gets.chomp

# initiate "case"
case choice
when "add"
    puts "Which movie would you like to add?"
    title = gets.chomp.to_sym # take input, chomp and change it to symbol

    # check to see if the title is already contained in the "movies" list
    if movies[title] == nil
        # if it isn't in the list - we add it along with a rating
        puts "What rating would you give the movie?"
        rating = gets.chomp.to_i # take input, chomp and change to integer

        # add the movie along with rating to the list
        movies[title] = rating
        puts "The movie and rating has been added!"
    else
        puts "The movie is already on the list!"
    end

when "update"
    puts "Which movie would you like to update?"
    title = gets.chomp.to_sym
    if movies[title] == nil
        puts "The movie title entered is not in the list"
    else
        puts "What do you want to update the rating to?"
        rating = gets.chomp.to_i
        movies[title] = rating
        puts "The title has been updated"
    end
when "display"
    puts "Movies & Rating:"
    movies.each {|movie, rating| puts "#{movie}: #{rating}"}

when "delete"
    puts "What title do you want to remove from the list?"
    title = gets.chomp.to_sym

    if movies[title] == nil
        puts "Sorry the title is not there. Try again"
    else
        movies.delete(title)
        puts "The title has been removed from the list"
    end



else
    puts "Sorry i did not get that - please try again"
end
