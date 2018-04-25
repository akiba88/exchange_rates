class CbrApi::Currency::ValuesGetter
  class << self
    def run
      CbrApi.get(path)
    rescue => e
      Rails.logger.error e
    end

    def path
      '/scripts/XML_daily.asp'
    end
  end
end
