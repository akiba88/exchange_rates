class CbrApi::Currency::ListGetter
  class << self
    def run
      CbrApi.get(path)
    rescue => e
      Rails.logger.error e
    end

    def path
      '/scripts/XML_val.asp'
    end
  end
end
