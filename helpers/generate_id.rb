require 'securerandom'

# ? Generates a random id
# * keeps the id generation logic in one place
# * makes it easier to change the implementation (if needed)
# * at any point in time.
# ! changing this implementation will affect all classes that use it.
# ! not in a bad way, but it's something to keep in mind.

def generate_id
  SecureRandom.uuid
end
