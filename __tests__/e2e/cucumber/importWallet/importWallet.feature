Feature: Import Wallet

  Scenario: Successfully Import a wallet 
    Given the user has selected an ARK Public Network profile
    And address 'Ae4QhpPV5AAGiJ6ao7vpeRb5EkvEhQchUV' has not been added to the user's profile
    And the user has selected 'My Wallets'
    And the user has selected 'Import Wallet'
    When the user selects an address of 'Ae4QhpPV5AAGiJ6ao7vpeRb5EkvEhQchUV'
    And the user enters a passphrase of 'a' and selects 'Next'
    And the user does not add a 'Wallet Password' and selects 'Next'
    And the user does not provide a 'Wallet Name' and selects 'Done'
    Then the user will be navigated to the 'Transactions' screen of the created wallet
    And the imported wallet is displayed in the 'My Wallets' list

Scenario: Successfully Import a wallet (address only)
    Given the user has selected an ARK Public Network profile
    And address 'Ae4QhpPV5AAGiJ6ao7vpeRb5EkvEhQchUV' has not been added to the user's profile
    And the user has selected 'My Wallets'
    And the user has selected 'Import Wallet'
    And the user toggles 'Use the address only'
    When the user selects an address of 'Ae4QhpPV5AAGiJ6ao7vpeRb5EkvEhQchUV' and selects 'Next'
    And the user does not provide a 'Wallet Name' and selects 'Done'
    Then the user will be navigated to the 'Transactions' screen of the created wallet
    And the imported wallet is displayed in the 'My Wallets' list  

Scenario: Successfully Import a wallet (passphrae only)
    Given the user has selected an ARK Public Network profile
    And address 'Ae4QhpPV5AAGiJ6ao7vpeRb5EkvEhQchUV' has not been added to the user's profile
    And the user has selected 'My Wallets'
    And the user has selected 'Import Wallet'
    And the user toggles 'Use the passphrase only'
    When the user enters a passphrase of 'a' and selects 'Next'
    And the user does not add a 'Wallet Password' and selects 'Next'
    And the user does not provide a 'Wallet Name' and selects 'Done'
    Then the user will be navigated to the 'Transactions' screen of the created wallet
    And the imported wallet is displayed in the 'My Wallets' list

  Scenario: Fail to import wallet (wallet already exists)
    Given the user has selected an ARK Public Network profile
    And address 'Ae4QhpPV5AAGiJ6ao7vpeRb5EkvEhQchUV' already exists in the user's profile
    And the user has selected 'My Wallets'
    And the user has selected 'Import Wallet'
    When the user selects an address of 'Ae4QhpPV5AAGiJ6ao7vpeRb5EkvEhQchUV'
    And the user enters a passphrase of 'a' and selects 'Next'
    And the user does not add a 'Wallet Password' and selects 'Next'
    And the user does not provide a 'Wallet Name' and selects 'Done'
    Then the user should see the error 'Failed to Import Wallet: Cannnot create wallet Ae4QhpPV5AAGiJ6ao7vpeRb5EkvEhQchUV - it already exists'

