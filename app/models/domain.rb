require 'socket'

class Domain < ActiveRecord::Base
  validates_presence_of :hostname
  validates_uniqueness_of :hostname
  validates_presence_of :account_id
  validates_presence_of :ip_address

  belongs_to :account,
    inverse_of: :domains

  def self.get_ip(hostname)
    hostname = hostname.gsub(/http:\/\/+|www\.+|\//, '')
    Socket::getaddrinfo(hostname, 'www', nil, Socket::SOCK_STREAM)[0][3]
  end
end
