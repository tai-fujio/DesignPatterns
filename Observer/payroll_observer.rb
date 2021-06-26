class PayrollObserver
  def notify(employee)
    puts("#{employee.name}の給料が#{employee.salary}になりました。給与明細を変更してください。")
  end
end
