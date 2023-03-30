class Recipe 
  attr_accessor  :id, :name, :average_time, :rating

  def initialize(id = nil, name=nil, average_time=nil, rating=nil)
    @id = id
    @name = name
    @average_time = average_time
    @rating = rating

  end

  def ==(other)
    return false unless other.is_a?(Recipe)
    @id == other.id && @name == other.name && @average_time == other.average_time && @rating == other.rating
  end

  def to_s
    return "Recipe: #{name} - Average Time: #{average_time} min - Rate: #{rating} stars"

  end

end