class Employee
  
  attr_reader :salary
  
  def initialize(name, title, salary, boss)
    @name = name
    @title = title 
    @salary = salary  
    boss = boss
  end 
  
  def bonus(multiplier)
    @salary * multiplier
  end 
  
  def boss=(boss)
    boss.employees << self
    @boss = value
  end 
  
end 
class Manager < Employee
  
  attr_accessor :employees 
  
  def initialize(name, title, salary, boss)
    super
    @employees = []
  end 
  
  def bonus(multiplier)
    total = 0
    @employees.each do |employee| 
      total += employee.salary
    end 
    multiplier * total 
  end 
  
end 