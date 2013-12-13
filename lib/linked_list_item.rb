class LinkedListItem
  include Comparable
  attr_accessor :payload, :next_list_item

  def <=>(other)
    return self.payload <=> other.payload if (self.payload.class == other.payload.class)
    class1 = self.payload.class
    class2 = other.payload.class
    return 1 if (class1 == Symbol) or (class1 == String and class2 == Fixnum)
    return -1 if (class1 == Fixnum) or (class1 == String and class2 == Symbol)
  end

  def === (other)
    object_id == other.object_id
  end
  def initialize(item)
    @payload = item
  end

  def next_list_item=(item)
    raise ArgumentError if object_id == item.object_id
    @next_list_item =item
  end

  def last?
    self.next_list_item.nil?
  end
end
