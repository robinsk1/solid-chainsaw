class ValidatePassword
  class << self
    def valid?(password)
      @password = password.to_s
      return false unless min_length?
      return false unless contains_capital_letter?
      return false unless lower_case_letter?
      return false unless underscore?
      return false unless number?

      true
    end

    private

    def min_length?
      @password.length >= 8
    end

    def contains_capital_letter?
      @password.match(/[A-Z]/)
    end

    def lower_case_letter?
      @password.match(/[a-z]/)
    end

    def underscore?
      @password.match(/[_]/)
    end

    def number?
      @password.match(/[0-9]/)
    end
  end
end
