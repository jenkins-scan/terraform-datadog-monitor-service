
:datadog: Warf! Warf! Warf, Grrrr!!! Warf! :datadog: I meant... It's me again to re-notify:

{{#is_alert}}*Service `{{service.name}}` has got an `ALERT` in the `average-latency` metric.* :horrified: {{/is_alert}}
{{#is_warning}}*Service `{{service.name}}` has got a `WARNING` in the `average-latency` metric.* :broken-heart: {{/is_warning}}
{{#is_no_data}}*Service `{{service.name}}` has notified `NO DATA` in the `average-latency` metric.* :horrified: {{/is_no_data}}
{{#is_warning_recovery}}*Service `{{service.name}}` has `recovered` a WARNING in the `average-latency` metric.* :squirtle: {{/is_warning_recovery}}
{{#is_alert_recovery}}*Service `{{service.name}}` has `recovered` an ALERT in the `average-latency` metric.* :squirtle:  {{/is_alert_recovery}}
{{#is_no_data_recovery}}*Service `{{service.name}}` has `recovered` from NO DATA in the `average-latency` metric.* :squirtle:  {{/is_no_data_recovery}}
{{#is_recovery}}*Service `Recovered` in the `average-latency` metric Totally.* :mario_luigi_dance: :tlr_tia:{{/is_recovery}}
 
 
 
 
 
 
 
<!subteam^SLDUNA9QF|tstdevops>
%{ for recipients in recipient_list} 
${recipients}%{ endfor ~}