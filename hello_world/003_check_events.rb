require 'hawkular/hawkular_client'

entrypoint = ENV["HAWKULAR_URL"] || "http://localhost:8080/"
credentials = {username: "jdoe", password: "password"}
options = {tenant: "hawkular"}

client_alerts = Hawkular::Alerts::AlertsClient.new(entrypoint, credentials, options)

events = client_alerts.list_events({triggerIds: "my-test-trigger"})
puts "Events: #{events.length}"
events.each do |e|
  p e
end
