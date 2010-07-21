class Class
  def cattr_accessor(*meths)
    cattr_writer(*meths)
    cattr_reader(*meths)
  end
  def cattr_reader(*meths)
    meths.each do |meth|
      self.class.send(:define_method, meth) { class_variable_get("@@#{meth}") }
    end
  end
  def cattr_writer(*meths)
    meths.each do |meth|
      self.class.send(:define_method, :"#{meth}=") do |arg|
        class_variable_set("@@#{meth}", arg)
      end
    end
  end
end
