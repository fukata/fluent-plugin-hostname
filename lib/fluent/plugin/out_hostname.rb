require 'socket'

class Fluent::HostnameOutput < Fluent::Output
  Fluent::Plugin.register_output('hostname', self)

  include Fluent::SetTagKeyMixin
  config_set_default :include_tag_key, false

  include Fluent::SetTimeKeyMixin
  config_set_default :include_time_key, true

  config_param :key_name, :string, :default => 'host'
  config_param :host, :string, :default => Socket.gethostname

  def configure(conf)
    super

    if @key_name.empty?
      raise Fluent::ConfigError, "key_name is must not be specified"
    end
  end

  def emit(tag, es, chain)
    es.each do |time,record|
      record[@key_name] = @host 
      Fluent::Engine.emit(tag, time, record)
    end

    chain.next
  end
end
