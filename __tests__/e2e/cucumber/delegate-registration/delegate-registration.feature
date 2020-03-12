Feature: Delegate Registration

  Scenario: Succesfully Register a Delegate w/ Single Passphrase
    Given the user has selected a single passphrase wallet
    And the user's wallet has a balance of > 25
    And the user has selected the 'Registration' dropdown 
    And the user has selected 'Delegate Registration'
    When the user enters a valid 'Username'
    And the user selects the average fee
    And the user enters a valid passphrase
    And the user selects 'Next'
    Then the user selects 'Send' to confirm the trasnsaction
    And the transaction is broadcast to the network
    And the user sees the message 'Successfully registered as delegate'

  Scenario: Succesfully Register a Delegate w/ Second Passphrase
    Given the user has selected a second passphrase wallet
    And the user's wallet has a balance of > 25
    And the user has selected the 'Registration' dropdown
    And the user has selected 'Delegate Registration'
    When the user enters a valid 'Username'
    And the user selects the average fee
    And the user enters a valid passphrase
    And the user enters a valid second passphrase
    And the user selects 'Next'
    Then the user selects 'Send' to confirm the trasnsaction
    And the transaction is broadcast to the network
    And the user sees the message 'Successfully registered as delegate'

  Scenario: Succesfully Register a Delegate w/ Encrypted Passphrase
    Given the user has selected an encrypted passphrase wallet
    And the user's wallet has a balance of > 25
    And the user has selected the 'Registration' dropdown
    And the user has selected 'Delegate Registration'
    When the user enters a valid 'Username'
    And the user selects the average fee
    And the user enters a valid encrypted passphrase
    And the user selects 'Next'
    Then the user selects 'Send' to confirm the trasnsaction
    And the transaction is broadcast to the network
    And the user sees the message 'Successfully registered as delegate'

  Scenario: Fail to register delegate (special characters in name)
    Given the user has selected a single passphrase wallet
    And the user's wallet has a balance of > 25
    And the user has selected the 'Registration' dropdown
    And the user has selected 'Delegate Registration'
    When the user enters username 'AAA'
    And the user selects the average fee
    And the user enters a valid passphrase
    Then the user should see error 'No special characters or uppercase allowed'
    And the user cannot select 'Next'
    
  Scenario: Fail to register delegate (incorrect passphrase)
    Given the user has selected a single passphrase wallet
    And the user's wallet has a balance of > 25
    And the user has selected the 'Registration' dropdown
    And the user has selected 'Delegate Registration'
    When the user enters a valid 'Username'
    And the user selects the average fee
    And the user enters an invalid passphrase
    Then the user should see error 'The 'Passphrase' does not match the 'address''
    And the user cannot select 'Next'
  
  Scenario: Fail to register delegate (incorrect second passphrase) 
    Given the user has selected a second passphrase wallet
    And the user's wallet has a balance of > 25 
    And the user has selected the 'Registration' dropdown 
    And the user has selected 'Delegate Registration' 
    When the user enters a valid 'Username' 
    And the user selects the average fee 
    And the user enters an valid passphrase 
    And the user emters an invalid second passphrase 
    Then the user should see error 'The 'Passphrase' does not match the 'address'' 
    And the user cannot select 'Next'

  Scenario: Fail to register delegate (fail to dercrypt passphrase)
    Given the user has selected an ecrypted passphrase wallet
    And the user's wallet has a balance of > 25
    And the user has selected the 'Registration' dropdown
    And the user has selected 'Delegate Registration'
    When the user enters a valid 'Username'
    And the user selects the average fee
    And the user enters an invalid encrypted passphrase
    And the user selects 'Next'
    Then the user should see the error 'Failed to decrypt passphrase'

   
