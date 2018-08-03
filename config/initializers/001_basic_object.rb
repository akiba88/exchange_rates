class BasicObject
  def decorate
    if self.class.name == 'ActiveRecord::Relation'
      map(&:decorate_method)
    else
      decorate_method
    end
  end

protected

  def decorated_class_name
    ::Object.const_get "#{self.class}Decorator"
  end

  def decorate_method
    decorated_class_name.new(self)
  end
end
