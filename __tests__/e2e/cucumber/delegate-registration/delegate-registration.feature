Feature: Delegate Registration

  Scenario: Succesfully Register a Delegate w/ Single Passphrase
    Given the user has select a single passphrase
    And the user's wallet has a balance of > 25
    And the user has selected the 'Registration' dropdown 
    And the user has selected 'Delegate Registration'
    When the user enters a valid 'Username'
    And the user selects the average fee
    And the user enters a valid passphrase
    And the user selects 'Next'
    Then the user selects 'Send' to confirm the trasnsaction
    And the transaction is broadcast to the network
    And the user 



The username must have at least 1 character

   