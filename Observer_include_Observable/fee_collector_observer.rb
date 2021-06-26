class FeeCollectorObserver
  def initialize(employee)
    employee.add_observer(self)
  end

  def update(employee)
    puts("#{employee.name}の給料が#{employee.salary}になりました。会費の額を変更してください。")
  end
end
