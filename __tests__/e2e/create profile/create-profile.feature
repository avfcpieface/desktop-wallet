  Feature: Add new profile
  Add a new profile to the ARK Desktop Wallet
    
  Scenario: Successfully add a profile
    Given the user has launched the ARK Desktop Wallet
    And the user is on the profiles page
    And the user has selected Add Profile
	  When the user completes the profile details page and selects Next
	  And the user completes the network page and selects Next
	  And the user completes the appearance page and selects Done
	  Then the users profile should be created
	  And the user should be navigated to the dashboard of the created profile
    
  Scenario: Fail to advance past Profile Details
    Given the user has launched the ARK Desktop Wallet
    And the user is on the profiles page
    And the user has selected Add Profile
	  When the user completes the Profile Details page without a Profile Name
	  And the user selects Next
	  Then the user should see 'The name should have at least 1 character' under Profile Name
