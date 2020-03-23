Feature: Create Wallet

  Scenario: Successfully Create a new wallet (without wallet password)
    Given the user has selected an ARK Public Network profile
    And the user has selected 'My Wallets'
    And the user has selected 'Create Wallet'
    When the user selects an address and selects 'Next'
    And the user copies their 12 word passphrase and selects 'Next'
    And the user enters the correct third, sixth and ninth word of their passphrase and selects 'Next'
    And the user does not add a 'Wallet Password' and selects 'Next'
    And the user does not provide a 'Wallet Name' and selects 'Done'
    Then the user will be navigated to the 'Transactions' screen of the created wallet
    And the created wallet is displayed in the 'My Wallets' list

  Scenario: Successfully Create a new wallet (with wallet password)
    Given the user has selected an ARK Public Network profile
    And the user has selected 'My Wallets'
    And the user has selected 'Create Wallet'
    When the user selects an address and selects 'Next'
    And the user copies their 12 word passphrase and selects 'Next'
    And the user enters the correct third, sixth and ninth word of their passphrase and selects 'Next'
    And the user enters a 'Wallet Password' of '12345678!'
    And the user confirms the 'Wallet Password' with '12345678!'and selects 'Next'
    And the user does not provide a 'Wallet Name' and selects 'Done'
    Then the user will be navigated to the 'Transactions' screen of the created wallet
    And the created wallet is displayed in the 'My Wallets' list

  Scenario: Fail to create wallet (no wallet address selected)
    Given the user has selected an ARK Public Network profile
    And the user has selected 'My Wallets'
    And the user has selected 'Create Wallet'
    When the user fails to select a wallet addresss
    Then the user cannot select 'Next'

 Scenario: Fail to create wallet (cannot verify passphrase)
    Given the user has selected an ARK Public Network profile
    And the user has selected 'My Wallets'
    And the user has selected 'Create Wallet'
    When the user selects an address and selects 'Next'
    And the user copies their 12 word passphrase and selects 'Next'
    And the user enters the incorrrect third, sixth and ninth word of their passphrase 
    Then the user cannot select 'Next'

Scenario: Fail to create wallet (Wallet password requires special character)
    Given the user has selected an ARK Public Network profile
    And the user has selected 'My Wallets'
    And the user has selected 'Create Wallet'
    When the user selects an address and selects 'Next'
    And the user copies their 12 word passphrase and selects 'Next'
    And the user enters the correct third, sixth and ninth word of their passphrase and selects 'Next'
    And the user enters a 'Wallet Password' of '12345678'
    Then the user should see the error message 'Your password must contain at least 1 special character'
    And the user cannot select 'Next'

Scenario: Fail to create wallet (Wallet password requires 8 characters)
    Given the user has selected an ARK Public Network profile
    And the user has selected 'My Wallets'
    And the user has selected 'Create Wallet'
    When the user selects an address and selects 'Next'
    And the user copies their 12 word passphrase and selects 'Next'
    And the user enters the correct third, sixth and ninth word of their passphrase and selects 'Next'
    And the user enters a 'Wallet Password' of '!!!!!!!!!'
    Then the user should see the error message 'Your password must be at least 8 characters long'
    And the user cannot select 'Next'

Scenario: Fail to create wallet (Wallet password does not match)
    Given the user has selected an ARK Public Network profile
    And the user has selected 'My Wallets'
    And the user has selected 'Create Wallet'
    When the user selects an address and selects 'Next'
    And the user copies their 12 word passphrase and selects 'Next'
    And the user enters the correct third, sixth and ninth word of their passphrase and selects 'Next'
    And the user enters a 'Wallet Password' of '12345678!'
    And the user confirms the 'Wallet Password' with '123456788!
    Then the user should see the errror 'Your passwords do not match'
    And the usaer cannot select 'Next'