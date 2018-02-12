
# Calculating the size of mock world in Civilization III by recursion

# the continent_size method will be initiated on a tile with land and will "crawl" the map
# for each method call within the mathod, the method will check if the tile it is on is lan
# that way we can count the continent tile by tile


M = 'land'   # these are just helpers
o = 'water'

world = [
[o,o,o,o,M,M,o,o,o,o,o],
[o,o,o,o,M,M,o,o,o,o,o],
[o,o,o,o,o,M,o,o,M,M,o],
[o,o,o,M,o,M,o,o,o,M,o],
[o,o,o,o,o,M,M,o,o,o,o],
[o,o,o,o,M,M,M,M,o,o,o],
[M,M,M,M,M,M,M,M,M,M,M],
[o,o,o,M,M,o,M,M,M,o,o],
[o,o,o,o,o,o,M,M,o,o,o],
[o,M,o,o,o,M,M,o,o,o,o],
[o,o,o,o,o,M,o,o,o,o,o]]



def continent_size world, x, y

  begin
    if world[y][x] != 'land'
      # Either it's water or we already counted it
      return 0
    end
  rescue NoMethodError
    return 0
  end

  size = 1 # count current tile

  world[y][x] = 'counted land' # set the tile to 'counted'

  size = size + continent_size(world, x, y + 1) # we initiate the method for all surrounding tiles

  size = size + continent_size(world, x + 1, y + 1)

  size = size + continent_size(world, x + 1, y)

  size = size + continent_size(world, x + 1, y - 1)

  size = size + continent_size(world, x, y - 1)

  size = size + continent_size(world, x - 1, y - 1)

  size = size + continent_size(world, x - 1, y)

  size = size + continent_size(world, x - 1, y + 1)

  return size
end

puts continent_size(world, 5, 5) # => 33
