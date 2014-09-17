Before('@elasticsearch') do
  Business.reindex
  Business.searchkick_index.refresh
end

After do |s|
  # Tell Cucumber to quit after this scenario is done - if it failed.
  Cucumber.wants_to_quit = true if s.failed?
end
