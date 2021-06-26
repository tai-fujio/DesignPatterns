module Subject
  def initialize
    @observers = []
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
