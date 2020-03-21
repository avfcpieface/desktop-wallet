Feature: IPFS transaction

  Scenario: Succesfully send an IPFS transaction
    Given the user has selected a single passphrase wallet
    And the user's wallet has a balance of > 5
    And the user has selected the 'IPFS' tab 
    And the user has selected 'Store Hash'
    When the user enters a valid 'Hash'
    And the user selects the average fee
    And the user enters a valid passphrase
    And the user selects 'Next'
    Then the user selects 'Send' to confirm the trasnsaction
    And the transaction is broadcast to the network
    And the user sees the message 'IPFS created successfully'

  Scenario: Succesfully send an IPFS transaction w/ Second Passphrase
    Given the user has selected a second passphrase wallet
    And the user's wallet has a balance of > 5
    And the user has selected the 'IPFS' tab 
    And the user has selected 'Store Hash'
    When the user enters a valid 'Hash'
    And the user selects the average fee
    And the user enters a valid passphrase
    And the user enters a valid second passphrase
    And the user selects 'Next'
    Then the user selects 'Send' to confirm the trasnsaction
    And the transaction is broadcast to the network
    And the user sees the message 'IPFS created successfully'

  Scenario: Succesfully send an IPFS transaction w/ Encrypted Passphrase
    Given the user has selected an encrypted passphrase wallet
    And the user's wallet has a balance of > 5
    And the user has selected the 'IPFS' tab 
    And the user has selected 'Store Hash'
    When the user enters a valid 'Hash'
    And the user selects the average fee
    And the user enters a valid encrypted passphrase
    And the user selects 'Next'
    Then the user selects 'Send' to confirm the trasnsaction
    And the transaction is broadcast to the network
    And the user sees the message 'IPFS created successfully'

  Scenario: Fail to send IPFS Transaction (invalid Hash)
    Given the user has selected a single passphrase wallet
    And the user's wallet has a balance of > 5
    And the user has selected the 'IPFS' tab 
    And the user has selected 'Store Hash'
    When the user enters an invalid hash 'AAA'
    And the user selects the average fee
    And the user enters a valid passphrase
    Then the user should see error 'The IPFS Hash is not a valid hash'
    And the user cannot select 'Next'
    
  Scenario: Fail to send IPFS Transaction (incorrect passphrase)
    Given the user has selected a single passphrase wallet
    And the user's wallet has a balance of > 5
    And the user has selected the 'IPFS' tab 
    And the user has selected 'Store Hash'
    When the user enters a valid hash 
    And the user selects the average fee
    And the user enters an invalid passphrase
    Then the user should see error 'Next'The 'Passphrase' does not match the 'address''
    And the user cannot select 'Next'
  
   Scenario: Fail to send IPFS Transaction (incorrect second passphrase) 
    Given the user has selected a second passphrase wallet
    And the user's wallet has a balance of > 5
    And the user has selected the 'IPFS' tab 
    And the user has selected 'Store Hash'
    When the user enters a valid hash 
    And the user selects the average fee
    And the user enters a valid passphrase
    And the user enters an invalid second passphrase
    Then the user should see error 'Next'The 'Passphrase' does not match the 'address''
    And the user cannot select 'Next'

  Scenario: Fail to send IPFS Transaction (fail to decrypt passphrase)
    Given the user has selected a wallet with an encrypted passphrase
    And the user's wallet has a balance of > 5
    And the user has selected the 'IPFS' tab 
    And the user has selected 'Store Hash'
    When the user enters a valid hash 
    And the user selects the average fee
    And the user enters an invalid encrpyted passphrase
    And the user selects 'Next'
    Then the user should see the error 'Failed to decrypt passphrase'
