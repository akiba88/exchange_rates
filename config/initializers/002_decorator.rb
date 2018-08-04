class Decorator
  attr_reader :source

  def initialize(source)
    @source = source
  end

  def as_json(*options)
    source.as_json(*options)
  end

  def to_param
    source.id.to_s
  end

  def method_missing(method, *args, &block)
    return super unless respond_to_missing?(method)

    source.send(method)
  end

  def respond_to_missing?(method, _include_private = false)
    source.respond_to?(method)
  end
end
