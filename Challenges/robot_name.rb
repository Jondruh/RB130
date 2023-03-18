# PROCESS
# when a robot is instantiated generate a new name for it
# when there is robot object and #name is called either give the current name
# or if there is no name generate a new name.

# if we a robot calls reset then erase the name

# name schema: two capital letters A-Z followed by 3 digits
# -> AU482 #valid
# -> AUE28 #invalid

# No currently created robots should have the same name as another robot
# Use #rand to generate random numbers?
# is #sample random?
# Range 

class Robot
  @@in_use_names = []

  def name
    return @name unless !@name

    @name = generate_name until unique_name?

    @@in_use_names << @name
    @name
  end

  def reset
    @@in_use_names.delete(@name)
    @name = nil
  end
  
  private

  def unique_name?
    !@@in_use_names.include?(@name)
  end

  def generate_name
    random_nums = []
    3.times { random_nums << rand(0..9) }
    (('A'..'Z').to_a.sample(2) << random_nums.map(&:to_s)).join
  end
end