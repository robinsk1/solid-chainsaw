##
# Validates a password according to a set of pre-defined validation rules
class ValidatePassword
  class << self
    ##
    # @param [String] password The password that will be checked
    # @return [Boolean] returns true or false if password is valid or not
    def valid?(password)
      @password = password.to_s

      min_length? &&
        contains_capital_letter? &&
        lower_case_letter? &&
        underscore? &&
        number?
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
