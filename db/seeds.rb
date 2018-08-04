unless Currency.any?
  Currencies::UpdateList.new.run
  Currencies::UpdateValues.new.run
end
