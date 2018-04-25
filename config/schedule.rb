set :environment, ENV['RAILS_ENV']

every 10.minutes do
  runner 'Currencies::UpdateValues.new.run'
end
