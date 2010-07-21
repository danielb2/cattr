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
        # if we can get the class variable it means it exists so
        # we don't want to overwrite it.
        begin
          class_variable_get("@@#{meth}")
        rescue NameError
          # if we get a nameerror, then it didn't exist so let's set it
          class_variable_set("@@#{meth}", arg)
        end
      end
    end
  end
end
