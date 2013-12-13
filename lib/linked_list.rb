class LinkedList
  attr_reader :first_item
  def initialize(*args)
    args.each {|payload| add_item(payload)}
  end

  def add_item(payload)
    return @first_item = LinkedListItem.new(payload) if @first_item.nil?
    item = @first_item
    until item.last?
      item = item.next_list_item
    end
    item.next_list_item = LinkedListItem.new(payload)
  end

  def get(index)
    raise IndexError if index < 0
    item = @first_item
    index.times do
      raise IndexError if item.nil?
      item = item.next_list_item
    end
    item.payload
  end

  def size
    count = 0
    item = @first_item
    until item.nil?
      item = item.next_list_item
      count += 1
    end
    count
  end

  def last
    item = @first_item
    return item if item.nil?
    until item.last?
      item = item.next_list_item
    end
    item.payload
  end

  def to_s
    item = @first_item
    return "| |" if item.nil?
    string = "#{item.payload}"
    until item.last?
      item = item.next_list_item
      new_load = item.payload
      string = "#{string}, #{new_load}"
    end
    "| #{string} |"
  end

  def [](index)
    get(index)
  end

  def []=(index, value)
    item = @first_item
    index.times do
      item = item.next_list_item
    end
    item.payload = value
  end

  def remove(index)
    return @first_item = @first_item.next_list_item if index == 0
    item = @first_item
    (index - 1).times do
      item = item.next_list_item
    end
    raise IndexError if item.nil?
    item.next_list_item = item.next_list_item.next_list_item
  end

  def indexOf(payload)
    item = @first_item
    index = 0
    return nil if item.nil?
    until item.payload == payload
      return nil if item.last?
      item = item.next_list_item
      index += 1
    end
    index
  end

  def sorted?
    item = @first_item
    return true if item.nil?
    until item.last?
      return false if item > item.next_list_item
      item = item.next_list_item
    end
    true
  end

  def sort
    item = @first_item
    return self if item.nil?
    until sorted?
      if item > item.next_list_item
        swap(item)
        sort
      else
        item = item.next_list_item
      end
    end
    self
  end

  def swap(item)
    index = indexOf(item.payload)
    old_playload = get(index)
    new_payload = get(index + 1)
    self[index] = new_payload
    self[index + 1] = old_playload
  end

  def swap_with_next(index)
    raise IndexError if index == size - 1
    first_payload = get(index)
    second_payload = get( index + 1)
    self[index] = second_payload
    self[index + 1]= first_payload
  end
end