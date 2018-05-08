class CurrenciesRepresenter
  class << self
    def generate
      Currency.all.each_with_object([]) do |object, result|
        result << element(object.decorate)

        result
      end
    end

    def element(object)
      {
        code: object.parent_code,
        name: object.name,
        current_value: object.display_value,
        forced_value: object.forced_value,
        forced_expiriation_at: object.display_forced_expiriation_at
      }
    end
  end
end
