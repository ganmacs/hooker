require 'hooker/version'

module Hooker
  def self.included(base)
    base.extend(ClassMethods)
    base.prepend(Hook)
  end

  module Hook; end

  module ClassMethods
    def before_hooker(hk_caller, hk_method)
      Hook.module_eval <<-EOS
        def __before_#{hk_caller}(*args, &block)
          #{hk_method}
        end
      EOS
      __hooker__(hk_caller)
    end

    def after_hooker(hk_caller, hk_method)
      Hook.module_eval <<-EOS
        def __after_#{hk_caller}(*args, &block)
          #{hk_method}
        end
      EOS
      __hooker__(hk_caller)
    end

    def __hooker__(hk_caller)
      Hook.module_eval <<-EOS
        def #{hk_caller}(*args, &block)
          __before_#{hk_caller} if respond_to?(:__before_#{hk_caller})
          super(*args, &block)
          __after_#{hk_caller} if respond_to?(:__after_#{hk_caller})
        end
      EOS
    end
  end
end
