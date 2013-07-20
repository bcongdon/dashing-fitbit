# widget configuration

unit_system = "METRIC"
date_format = "%H:%M"

fitbit = Fitbit.new unit_system: unit_system, date_format: date_format

SCHEDULER.every "15m", :first_in => 0 do |job|

  send_event "fitbit", {
    device:   fitbit.device,
    steps:    fitbit.steps,
    calories: fitbit.calories,
    distance: fitbit.distance,
    active:   fitbit.active
  }
end
