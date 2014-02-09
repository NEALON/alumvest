module Network

  def server_ip
    require 'socket'
    ip=Socket.ip_address_list.detect { |intf| intf.ipv4_private? }
    myip = ip ? ip.ip_address : '127.0.0.1'
    return myip
  end

end