class ValidatePassword
  def initialize password
    @password = password.to_s
  end

  def valid?
    return false unless min_length?
    return false unless contains_capital_letter?
    return false unless has_lower_case_letter?
    return false unless has_underscore?
    return false unless has_number?

    true
  end

  private

  def min_length?
    @password.length >= 8
  end

  def contains_capital_letter?
    @password.match(/[A-Z]/)
  end

  def has_lower_case_letter?
    @password.match(/[a-z]/)
  end

  def has_underscore?
    @password.match(/[_]/)
  end

  def has_number?
    @password.match(/[0-9]/)
  end
end
