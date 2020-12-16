rules = File.read('puzzle_input.txt').split(/.\n/)
bag_nodes = {}

rules.each do |rule|
  bag_name, content = rule.split(/bags[s]? contain/).map { |c| c.strip }
  bag_nodes[bag_name] = content.split(",")
end

def find_bag(path, bag_nodes, explored=[])
  res = 0

  for destination in bag_nodes[path]
    /(\d+) ([a-z]+ [a-z]+)/.match(destination)
      if bag_nodes[$2] == "no other bags" || $1 == nil
        res += 0
        next
      else
        res += $1.to_i + ($1.to_i * find_bag($2, bag_nodes, found))
        end
    end
  return res
end

p find_bag("shiny gold", bag_nodes)