class Class
  def cattr_accessor(*meths)
    meths.each do |meth|
      class_variable_set "@@#{meth}", nil
      self.class.send(:define_method, meth) { class_variable_get("@@#{meth}") }
      self.class.send(:define_method, :"#{meth}=") { |arg| class_variable_set("@@#{meth}", arg) }
    end
  end
  def cattr_reader(*meths)
  end
  def cattr_writer(*meths)
  end
end
