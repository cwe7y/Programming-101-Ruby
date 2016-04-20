class Object

  def blank?
    if is_a?(String)
      true if self =~ /^\s+$/
    elsif respond_to?(:empty?) == false
      true
    else
      empty?
    end
  end

  def present?
    !blank?
  end

  def presence
    if present?
      self
    else 
      return nil
    end
  end

  def try(method)
    if nil?
      nil
    else
      return send(method)
    end
  end
end


class StringInquirer < String
  def method_missing(method)
    if self == method.to_s.chop
      return true
    else
      return false
    end
  end
end


class String
  def inquiry
   

  end
end