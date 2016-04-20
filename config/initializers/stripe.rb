Rails.configuration.stripe = {
  :publishable_key => 'pk_test_Tw4MW7Uau9psLfXUvdXINXbQ',
  :secret_key      => 'sk_test_1Eim4cLWKVXT0g2jUpE6XGeh'
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]
