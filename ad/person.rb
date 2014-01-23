class Person

  attr_accessor :name

  def initialize(hash)
    self.name = hash[:givenname].first
  end

  def self.from_list(list)
    return list.map { |x| Person.new(x)}
  end

end