 class Object

   def singleton_class 
     class << self
       self
     end
   end

    def define_singleton_method(name, &block)
       singleton_class.send(:define_method, name, &block)
   end

 end

 class String
   def to_proc
   proc do |obj, args|
       self.split('.').each do |method|
         obj = obj.send(method, *args)
       end
     end
   end
 end

class Module
  private
  
  def private_attr_reader(*name)
    name.each do |arg|
      define_method(arg) {instance_variable_get("@#{arg}")} 
      private "#{arg}"
    end
  end

  def private_attr_writer(*name)
   name.each do |arg|
      define_method("#{arg}=") {instance_variable_set("@#{arg}", arg)}
      private arg
    end
  end 

  def private_attr_accessor(*args)
    args.each do |arg|
      self.class_eval("def #{arg};@#{arg};end") #getter
      self.class_eval("def #{arg}=(val);@#{arg}=val;end") #setter
      private "#{arg}", "#{arg}="
    end
  end


  public

  def cattr_reader(*args, &block)
    singleton_class.class_eval do
      args.each do |arg|
       define_method(arg) do
          class_variable_set("@@#{name}", block.call) if block
          class_variable_get("@@#{name}")
        end
      end
    end
  end
  

  def cattr_writter(*args, &block)
    args.each do |arg|
    self.instance_eval("def #{arg}=(val);@#{arg}=val;@#{yield(arg)};end")

  end

  def cattr_accessor(*args, &block)
    args.each do |arg|
      cattr_writter(*args, &block)
      cattr_reader(*args, &block)
    end
  end

end  

class NilClass

   def method_missing(method_name, *args, &block) 
     puts ' '
   end

end


class Proxy
  def initialize(args)
    @args = args
  end

  def method_missing(method)
    @args.send(method)
  end

  def respond_to_missing?(method, *)
    @args.respond_to? :method
  end
end

class Object
  def delegate(methоd_name)

  end
end

class TestClass
  private_attr_accessor :foo

  def some_public_method_on_foo
    foo + 42
  end

end

m = Module.new
t = TestClass.new
#t.foo #NoNameError 
t.send(:foo=, 42)
 t.send(:foo)
t.some_public_method_on_foo



