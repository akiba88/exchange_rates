class Decorator
  attr_reader :source

  def initialize(source)
    @source = source
  end

  def to_param
    source.id.to_s
  end

  def method_missing(method, *args, &block)
    return super unless respond_to_missing?(method)

    source.send(method)
  end

  def respond_to_missing?(method)
    source.respond_to?(method)
  end
end
