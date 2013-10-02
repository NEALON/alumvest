module Validators

  def is_max_n_words(attr, max)
    errors.add(attr.to_sym, "can't be more than #{max} words") if send(attr) && send(attr).scan(/(\w|-)+/).size > max
  end

  def is_between_n_words(attr, min, max)
    errors.add(attr.to_sym, "must be between #{min} words and #{max} words") if
        send(attr) &&
            (send(attr).scan(/(\w|-)+/).size > max or
                send(attr).scan(/(\w|-)+/).size < min)
  end


end