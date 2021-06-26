require './subject.rb'
require './payroll_observer.rb'
require './fee_collector_observer.rb'

class Employee
  include Subject

  attr_reader :name, :salary

  def initialize(name, salary)
    super()
    @name = name
    @salary = salary
  end

  def salary=(salary)
    @salary = salary
    notify_observers
  end
end

employee = Employee.new('従業員A','255_000')
payroll = PayrollObserver.new
fee = FeeCollectorObserver.new
end_of_msg = Proc.new {|employee|
  puts("#{employee.name}に関するnotifyは以上です。")}
employee.add_observer(payroll, fee, &end_of_msg)
employee.salary = 275_000
