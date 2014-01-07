class SsnValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value =~ /^\d{3}-?\d{2}-?\d{4}$/i
      record.errors[attribute] << (options[:message] || "bad ssn format (should be XXX-XX-XXXX)")
    end
  end
end
