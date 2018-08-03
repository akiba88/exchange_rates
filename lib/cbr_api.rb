class CbrApi
  class << self
    def get(path, params = {})
      HTTP.get(url_builder(path), json: params)
    end

    def url_builder(path)
      URI::HTTP.build(host: 'cbr.ru', path: path).to_s
    end
  end
end
