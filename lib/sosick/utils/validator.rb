class Validator
  def self.validate_arguments(mode)
    if ["development", "production", "production2", "test"].include?(mode) 
      return true
      
    else
      raise ArgumentError, "you should chose environment from [\"development\", \"production\", \"test\"]"
    end
  end
end
