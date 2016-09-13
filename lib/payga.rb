require "payga/engine"

module Payga
  def configure params = {}
    options = System.new params
  end

  def setup which = nil
    cur = System.where(merchant: which).first if which
    cur ||= System.where(default: true).first
    class_variable_set('@@current', cur)
  end

  def current
    class_variable_get('@@current')
  end

  module_function :configure, :setup, :current
end
