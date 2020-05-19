# frozen_string_literal: true

# Player class
class Player

  attr_accessor :name
  attr_reader :token

  def initialize(name, token)
    @name = name
    @token = token
  end

  def to_s
    "#{name}'s token is #{token}"
  end

end
