require_relative 'linked_list.rb'

list = LinkedList.new("first_head")
list.append('append')
list.to_s
list.prepend('prepend')
list.to_s
p list.size
p list.head
p list.tail
list.pop
list.to_s
p list.contains?('append')
p list.contains?('prepend')
p list.find("asdnlasdlkasd")
p list.find("first_head")
p list.at(1)
