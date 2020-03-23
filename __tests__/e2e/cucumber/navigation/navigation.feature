Feature: Top Level UI Navigation

  Scenario: Succesfully navigate to Dashboard
    Given the user has loaded an ARK Public Network profile
    When the user selects 'Dashboard'
    Then the 'Dashboard' screen should be displayed

  Scenario: Succesfully navigate to My Wallets
    Given the user has loaded an ARK Public Network profile
    When the user selects 'My Wallets'
    Then the 'My Wallets' screen should be displayed

  Scenario: Succesfully navigate to My Contacts
    Given the user has loaded an ARK Public Network profile
    When the user selects 'My Contacts'
    Then the 'My Contacts' screen should be displayed

  Scenario: Succesfully navigate to Announcements
    Given the user has loaded an ARK Public Network profile
    When the user selects 'Announcements'
    Then the 'Annnouncements' screen should be displayed

  Scenario: Succesfully navigate to Plugin Manager
    Given the user has loaded an ARK Public Network profile
    When the user selects 'Plugin Manager'
    Then the 'Plugin Manager' screen should be displayed

  Scenario: Succesfully navigate to Current Settings
    Given the user has loaded an ARK Public Network profile
    When the user selects 'Current Settings'
    Then the 'Current Settings' options should be displayed
 
  Scenario: Succesfully navigate to Network
    Given the user has loaded an ARK Public Network profile
    When the user selects 'Network'
    Then the 'Network' options should be displayed 

  Scenario: Succesfully navigate to Profiles
    Given the user has loaded an ARK Public Network profile
    When the user selects 'Profiles'
    Then the 'Profiles' screen should be displayed  