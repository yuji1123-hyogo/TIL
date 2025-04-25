class ApplicationMailbox < ActionMailbox::Base
  ISBN_PATTERN = /^review\-(978-4-[0-9]{3,5}-[0-9]{4,5}-[0-9X])@/i
  routing ISBN_PATTERN => :reviews
end
