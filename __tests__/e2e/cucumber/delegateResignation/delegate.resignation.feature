Feature: Delegate Resignation Transaction

  Scenario: Succesfully Resign a Delegate w/ Single Passphrase
    Given the user has selected a single passphrase wallet
    And the user's wallet has a balance of > 25
    And the user's wallet has registered as a delegate
    And the user has selected the 'Registration' dropdown 
    And the user has selected 'Delegate Resignation'
    When the user selects the average fee
    And the user enters a valid passphrase
    And the user selects 'Next'
    Then the user selects 'Send' to confirm the trasnsaction
    And the transaction is broadcast to the network
    And the user sees the message 'Delegate resignation was successful'

    Scenario: Succesfully Resign a Delegate w/ Second Passphrase
    Given the user has selected a second passphrase wallet
    And the user's wallet has a balance of > 25
    And the user's wallet has registered as a delegate
    And the user has selected the 'Registration' dropdown
    And the user has selected 'Delegate Resignation'
    When the user selects the average fee
    And the user enters a valid passphrase
    And the user enters a valid second passphrase
    And the user selects 'Next'
    Then the user selects 'Send' to confirm the trasnsaction
    And the transaction is broadcast to the network
    And the user sees the message 'Delegate resignation was successful'

  Scenario: Succesfully Resign a Delegate w/ Encrypted Passphrase
    Given the user has selected an encrypted passphrase wallet
    And the user's wallet has registered as a delegate
    And the user's wallet has a balance of > 25
    And the user has selected the 'Registration' dropdown
    And the user has selected 'Delegate Resignatation'
    When the user selects the average fee
    And the user enters a valid encrypted passphrase
    And the user selects 'Next'
    Then the user selects 'Send' to confirm the trasnsaction
    And the transaction is broadcast to the network
    And the user sees the message 'Delegate resignation was successful'

  Scenario: Fail to resign delegate (incorrect passphrase)
    Given the user has selected a single passphrase wallet
    And the user's wallet has registered as a delegate
    And the user's wallet has a balance of > 25
    And the user has selected the 'Registration' dropdown
    And the user has selected 'Delegate Resignation'
    When the user selects the average fee
    And the user enters an invalid passphrase
    Then the user should see error 'The 'Passphrase' does not match the 'address''
    And the user cannot select 'Next'
  
  Scenario: Fail to resign delegate (incorrect second passphrase) 
    Given the user has selected a second passphrase wallet
    And the user's wallet has registered as a delegate
    And the user's wallet has a balance of > 25 
    And the user has selected the 'Registration' dropdown 
    And the user has selected 'Delegate Registration'  
    When the user selects the average fee 
    And the user enters an valid passphrase 
    And the user emters an invalid second passphrase 
    Then the user should see error 'The 'Passphrase' does not match the 'address'' 
    And the user cannot select 'Next'

  Scenario: Fail to register delegate (fail to dercrypt passphrase)
    Given the user has selected an ecrypted passphrase wallet
    And the user's wallet has registered as a delegate
    And the user's wallet has a balance of > 25
    And the user has selected the 'Registration' dropdown
    And the user has selected 'Delegate Resignation'
    When the user selects the average fee
    And the user enters an invalid encrypted passphrase
    And the user selects 'Next'
    Then the user should see the error 'Failed to decrypt passphrase'

   
