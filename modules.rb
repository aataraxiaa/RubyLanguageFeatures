# Source: https://world.hey.com/jorge/code-i-like-i-domain-driven-boldness-71456476
# Takeaways
# 1. Modules define common functionality which can be mixed in to classes
# 2. We can define nested modules using `Parent::Child` syntax

module Petitioner 
  def petition
    puts 'Petitioning!'
  end
end

class Contact < Person
  include Petitioner

  def hi
    puts 'hi'
  end
end

module Contact::Petitioner
  def contact_petition
    puts 'Contact petition!'
  end
end

class SubContact
  include Contact::Petitioner
end

contact = Contact.new
contact.hi
contact.petition

subcontact = SubContact.new
subcontact.contact_petition