require './payroll_observer.rb'
require './fee_collector_observer.rb'

class Employee
  attr_reader :name, :title, :salary

  def initialize(name, salary)
    @name = name
    @salary = salary
    @observers = []
  end

  def salary=(salary)
    @salary = salary
    notify_observers
  end

  def add_observer(*observers)
    observers.each { |observer| @observers << observer }
  end

  def delete_observer(*observers)
    observers.each { |observer| @observers.delete(observer) }
  end

  def notify_observers
    @observers.each { |observer| observer.notify(self) }
  end
end

employee = Employee.new('従業員A','255_000')
payroll = PayrollObserver.new
fee = FeeCollectorObserver.new
employee.add_observer(payroll, fee)
employee.salary = 275_000
#=>従業員Aの給料が275000になりました。給与明細を変更してください。
#=>従業員Aの給料が275000になりました。会費の額を変更してください。
