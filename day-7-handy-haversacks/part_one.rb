rules = File.read('puzzle_input.txt').split(/.\n/)
direct = []
bag_nodes = {}
memo = {}
fit = 0

# generate nodes and edges to visit
rules.each do |rule|
  bag_name, content = rule.split(/bags[s]? contain/).map { |c| c.strip }

  bag_nodes[bag_name] = content.split(",").map do |cont|
    /\d+ ([a-z]+ [a-z]+) bag[s]?/.match(cont)
    $1
  end

  if /shiny gold bag/.match?(rule)
    direct.push(bag_name)
  end
end

def find_bag?(search_bags, direct, bag_nodes, memo)
  queue = search_bags
  explored = []

  while queue.size > 0
    path = queue.delete_at(0)

    if direct.include?(path)
      return true
    else
      next if bag_nodes[path] == nil

      if memo[path]
        return true
      elsif memo.has_key?(path)
        next
      end

      explored.push(path)
      for destination in bag_nodes[path]
        queue.push(destination) if !(queue.include?(destination)) && !(explored.include?(destination))
      end
    end
  end
  return false
end

rules.each do |rule|
  bag = /^([a-z]+ [a-z]+)/.match(rule)[0]
  if find_bag?([bag], direct, bag_nodes, memo) && (bag != "shiny gold")
    memo[bag] = true
    fit += 1
  else
    memo[bag] = false
  end
end

p fit
