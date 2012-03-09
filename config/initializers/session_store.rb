# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_wordtoyourmother_session',
  :secret      => '511aef173073374598e763c7c0ef694c294fcc5d2f50984145b7a87c41670478fb236d2ac94688958b9d9c66a113af80f1b35a94ca4cf1065d6a311ad8bce067'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
