module SampleModule
  def foo
    puts "world"
  end
end

class Sample
  include SampleModule
  
  def foo
    puts "hello"
  end
end

