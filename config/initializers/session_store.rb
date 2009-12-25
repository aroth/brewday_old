# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_brewday_session',
  :secret      => '02a79e0a0cc2e7fe2edf3e4fc43462dea5b071aa0c60a937e9729381de4ed4a9c64f0eb65455e33c42266f81140cee7b67b37ab497be5613f5a7aa442887b8eb'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
