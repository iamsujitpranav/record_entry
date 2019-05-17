require "ldap"

module PerformOperations
  def connection
    @conn = LDAP::Conn.new(host = 'localhost', port = LDAP_PORT)
    @conn.bind
  end

  def add(row)
    entry = LDAP.mod(LDAP::LDAP_MOD_ADD, 'cn', row)

    begin
      @conn.add("cn = #{row} , dc = example, dc =  org", entry)
    rescue LDAP::ResultError
      @conn.perror("add")
    end
  end

  def delete(row)
    entry = LDAP.mod(LDAP::LDAP_MOD_DELETE, 'cn', row)

    begin
      @conn.delete("cn = #{row} , dc = example, dc =  org", entry)
    rescue LDAP::ResultError
      @conn.perror("delete")
    end
  end
end