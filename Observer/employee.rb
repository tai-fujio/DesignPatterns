# require './subject.rb'
require 'observer'
require './payroll_observer.rb'
require './fee_collector_observer.rb'

class Employee
  #include Subject
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
# payroll = PayrollObserver.new
# fee = FeeCollectorObserver.new
# employee.add_observer(payroll, fee)
employee.salary = 275_000
#=>従業員Aの給料が275000になりました。給与明細を変更してください。
#=>従業員Aの給料が275000になりました。会費の額を変更してください。
