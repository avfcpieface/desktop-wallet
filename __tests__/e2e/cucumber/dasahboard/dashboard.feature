  Feature: Dashboard Chart Testing

  Scenario: Toggle Price Chart 'Off'
     Given the user has loaded an ARK Public Network profile
     And the user has selected 'Dashboard'
     When the user toggles Show Chart to 'Off'
     Then the chart is no longer displayed

  Scenario: Toggle Price Chart 'On'
     Given the user has loaded an ARK Public Network profile
     And the user has selected 'Dashboard'
     When the user toggles Show Chart to 'On'
     Then the chart is displayed

  Scenario: Toggle Price Chart 'Day'
     Given the user has loaded an ARK Public Network profile
     And the user has selected 'Dashboard'
     And the chart is toggled to 'On'
     When the user selects the view the chart option 'Day'
     Then the 'Day' chart is displayed

   Scenario: Toggle Price Chart 'Week'
     Given the user has loaded an ARK Public Network profile
     And the user has selected 'Dashboard'
     And the chart is toggled to 'On'
     When the user selects the view the chart option 'Week'
     Then the 'Week' chart is displayed

   Scenario: Toggle Price Chart 'Month'
     Given the user has loaded an ARK Public Network profile
     And the user has selected 'Dashboard'
     And the chart is toggled to 'On'
     When the user selects the view the chart option 'Month'
     Then the 'Month' chart is displayed