class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  after_create :create_customer

  def create_customer
    token = self.stripe_card_token

    customer = Stripe::Customer.create(
      :source => token,
      :email => self.email
    )
    charge = Stripe::Charge.create(
      :customer => customer.id,
      :amount => 100,
      :description => 'IA Math Projects Subscription',
      :currency => 'usd'
    )

  end
end
