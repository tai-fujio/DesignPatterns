module Subject
  def initialize
    @observers = []
  end

  def add_observer(*observers, &observer)
    observers.each { |observer| @observers << observer }
    if observer&.arity == 1
      @observers << observer
    end
  end

  def delete_observer(*observers)
    observers.each { |observer| @observers.delete(observer) }
  end

  def notify_observers(employee)
    @observers.each { |observer| 
      if observer.respond_to?(:notify)
        observer.notify(employee)
      elsif observer.respond_to?(:call)
        observer.call(self)
      end
    }
  end
end
