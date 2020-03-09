Feature: Send a vote transaction


  Scenario: Successfully send a vote transaction w/ Single Passphrase
    Given the user has selected a wallet with a single passphrase
    And the wallet has a balance 
    And the user has selects the 'Delegates' tab
    And the user has selected a delegate to vote for
    When the user select 'Vote' 
    And the user selects the 'Average' fee
    And the user enters a valid passphrase
    And the user confirms the transaction
    Then the transaction will be broadcast to the network
    And the user will see a 'Voted Succesfully' message
    And the delegate that the user voted for will have a 'Vote' label 

  Scenario: Successfully send a vote transaction w/ Second Passphrase
    Given the user has selected a wallet with a second passphrase
    And the wallet has a balance 
    And the user has selects the 'Delegates' tab
    And the user has selected a delegate to vote for
    When the user select 'Vote' 
    And the user selects the 'Average' fee
    And the user enters a valid passphrase
    And the user enters a valid second passphrase
    And the user confirms the transaction
    Then the transaction will be broadcast to the network
    And the user will see a 'Voted Succesfully' message
    And the delegate that the user voted for will have a 'Vote' label 

  Scenario: Successfully send a vote transaction w/ Encrypted Passphrase
    Given the user has selected a wallet with a second passphrase
    And the wallet has a balance 
    And the user has selects the 'Delegates' tab
    And the user has selected a delegate to vote for
    When the user select 'Vote' 
    And the user selects the 'Average' fee
    And the user enters a valid encrypted passphrase
    And the user confirms the transaction
    Then the transaction will be broadcast to the network
    And the user will see a 'Voted Succesfully' message
    And the delegate that the user voted for will have a 'Vote' label 

  Scenario: Fail to send a vote transaction (insufficient balance)
    Given the user has selected a wallet with a second passphrase
    And the wallet has no balance 
    And the user has selects the 'Delegates' tab
    And the user has selected a delegate to vote for
    When the user select 'Vote' 
    And the user selects the 'Average' fee
    And the user enters a valid passphrase
    Then the user should see the error 'The balance is too low'
    And the user cannot select 'Next'

  Scenario: Fail to send a vote transaction (passphrase incorrect)
    Given the user has selected a wallet with a single passphrase
    And the wallet has a balance
    And the user has selects the 'Delegates' tab
    And the user has selected a delegate to vote for
    When the user select 'Vote'
    And the user selects the 'Average' fee
    And the user enters an invalid passphrase
    Then the user should see the error "The 'Passphrase' does not match the 'address'"
    And the user cannot select 'Next'

  Scenario: Fail to send a vote transaction (second passphrase incorrect)
    Given the user has selected a wallet with a single passphrase
    And the wallet has a balance
    And the user has selects the 'Delegates' tab
    And the user has selected a delegate to vote for
    When the user select 'Vote'
    And the user selects the 'Average' fee
    And the user enters a valid passphrase
    When the user enters an invalid second passphrase
    Then the user should see the error "The 'Second Passphrase' does not match the 'address'"
    And the user cannot select 'Next'

  Scenario: Fail to send a vote transaction (encrypted passphrase incorrect)
    Given the user has selected a wallet with a single passphrase
    And the wallet has a balance
    And the user has selects the 'Delegates' tab
    And the user has selected a delegate to vote for
    When the user select 'Vote'
    And the user selects the 'Average' fee
    And the user enters an invalid encrpyted passphrase
    Then the user should see the error 'Failed to decrypt passphrase'
    And the user cannot select 'Next'
