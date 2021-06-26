require 'observer'
require './payroll_observer.rb'
require './fee_collector_observer.rb'

class Employee
  include Observable

  attr_reader :name, :salary

  def initialize(name, salary)
    super()
    @name = name
    @salary = salary
  end

  def salary=(salary)
    @salary = salary
    changed
    notify_observers(self)
  end
end

employee = Employee.new('従業員A','255_000')
PayrollObserver.new(employee)
FeeCollectorObserver.new(employee)
employee.salary = 275_000
