# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
SoprPlatform::Application.config.secret_key_base = ENV['SECRET_TOKEN'] || 'e8e6a874de38ce84f1946c25d275b3c2f1ad8476622fdac853bc3056bd14964b7d030cc71339030b030342d7de0334e8087853f91789564e0019857092bae88f'
