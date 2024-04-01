class CheckoutController < ApplicationController
    def create
        product = Stripe::Product.create({
            name: 'T-shirt',
            description: 'Comfortable cotton t-shirt',
            images: ['https://example.com/t-shirt.png'],
          })
        price = Stripe::Price.create({
            product: product.id,
            unit_amount: 2000,
            currency: 'usd',
          })
        @session = Stripe::Checkout::Session.create(
            line_items: [{
              price: price.id,
              quantity: 1,
              }],
            mode: 'payment',
            success_url: 'https://example.com/success?session_id={CHECKOUT_SESSION_ID}',
            cancel_url: 'https://example.com/cancel',
        )

    end
end 