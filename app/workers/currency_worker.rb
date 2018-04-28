class CurrencyWorker
  include Sidekiq::Worker

  sidekiq_options queue: :default, retry: false

  def perform(cyrrency_id, method)
    currency = Currency.find(cyrrency_id)

    currency.send(method)
  end
end
