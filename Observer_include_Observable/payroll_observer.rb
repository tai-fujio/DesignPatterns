class PayrollObserver
  def initialize(employee)
    employee.add_observer(self)
  end

  def update(employee)
    puts("#{employee.name}の給料が#{employee.salary}になりました。給与明細を変更してください。")
  end
end
