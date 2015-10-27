module ProvidersHelper
  def setup_provider(provider)
    3.times { provider.rates.build }
    provider
  end
end
