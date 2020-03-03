  Feature: Send a transaction
  
    
  Scenario: Successfully send a transaction w/ Single Passphrase
    Given the user has launched the ARK Desktop Wallet
    And the user has selected a wallet with a single passphrase  
    And the wallet has a balance > 2
    And the user has selected 'Send'
    When the user enters a valid recipient address
    And the user enters a valid token amount of '1'
    And the user enters a valid passphrase
    And the user confirms the transaction
    Then the transaction will be broadcast to the network
    And the user will see a 'Your transaction was succesfully sent' message
    And the sent token amount is subtracted from the overall balance

  Scenario: Successfully send a transaction w/ Second Passphrase
    Given the user has launched the ARK Desktop Wallet
    And the user has selected a wallet with a second passphrase
    And the wallet has a balance > 2
    And the user has selected 'Send'
    When the user enters a valid recipient address
    And the user enters a valid token amount of '1'
    And the user enters a valid passphrase
    And the user enters a valid second passphrase
    And the user confirms the transaction
    Then the transaction will be broadcast to the network
    And the user will see a 'Your transaction was succesfully sent' message
    And the sent token amount is subtracted from the overall balance

  Scenario: Successfully send a transaction w/ Encrypted Passphrase
    Given the user has launched the ARK Desktop Wallet
    And the user has selected a wallet with an ecrypted passphrase
    And the wallet has a balance > 2
    And the user has selected 'Send'
    When the user enters a valid recipient address
    And the user enters a valid token amount of '1'
    And the user enters a valid encryption password
    And the user confirms the transaction
    Then the transaction will be broadcast to the network
    And the user will see a 'Your transaction was succesfully sent' message
    And the sent token amount is subtracted from the overall balance
   
  Scenario: Fail to send transaction (insufficient balance)
    Given the user has launched the ARK Desktop Wallet
    And the user has selected a wallet with a balance < 1
    And the user has selected 'Send'
    And the user enters a valid token amount of '2'
    Then the user should see the error 'The balance is too low'
    And the user cannot select 'Next'
   
  Scenario: Fail to send transaction (passphrase incorrect)
    Given the user has launched the ARK Desktop Wallet
    And the user has selected a wallet with a single passphrase  
    And the wallet has a balance > 2
    And the user has selected 'Send'
    When the user enters a valid recipient address
    And the user enters a valid token amount of '1'
    When the user enters an invalid passphrase
    Then the user should see the error "The 'Passphrase' does not match the 'address'"
    And the user cannot select 'Next'

  Scenario: Fail to send transaction (second passphrase incorrect)
    Given the user has launched the ARK Desktop Wallet
    And the user has selected a wallet with a second passphrase
    And the wallet has a balance > 2
    And the user has selected 'Send'
    When the user enters a valid recipient address
    And the user enters a valid token amount of '1'
    And the user enters a valid passphrase
    When the user enters an invalid second passphrase
    Then the user should see the error "The 'Second Passphrase' does not match the 'address'"
    And the user cannot select 'Next'

  Scenario: Fail to send transaction (fail to decrypt passphrase)
    Given the user has launched the ARK Desktop Wallet
   And the user has selected a wallet with an ecrypted passphrase
    And the wallet has a balance > 2
    And the user has selected 'Send'
    When the user enters a valid recipient address
    And the user enters a valid token amount of '1'
    And the user enters an invalid encryption password
    And the user selects 'Next'
    Then the user should see the error 'Failed to decrypt passphrase'
    

