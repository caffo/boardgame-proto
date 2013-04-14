class Challenge < Hash 
  
  def initialize(initial_values)
    self.merge!(initial_values)
  end

  def solve
    result = instance_eval &self[:solve]
    self[:card].to(self[:discard_to])
    return result
  end
end