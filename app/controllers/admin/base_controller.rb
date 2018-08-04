class Admin::BaseController < ApplicationController
  http_basic_authenticate_with name: 'admin', password: 'root'

  helper_method :currencies_values_collection

  layout 'admin/application'

protected

  def currencies_values_collection
    @currencies_values_collection ||= Currency.all.map { |object| [object.name, object.id] }
  end
end
