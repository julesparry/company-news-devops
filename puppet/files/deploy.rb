module MCollective
  module Agent
    class Deploy < RPC::Agent
      metadata :name        => "Deploy",
               :description => "Deployment agent",
               :author      => "Anonymous",
               :version     => "0.1",
               :license     => "private",
               :url         => "http://cn.com",
               :timeout     => 600

      action "war" do
        validate :source, String
	war_file  = request[:source]
	%x{ wget #{war_file} -O /tmp/company-news.war } 
	%x{ service tomcat6 stop }
	%x{ rm -rf /var/lib/tomcat6/webapps/* }
	%x{ mv /tmp/company-news.war /var/lib/tomcat6/webapps/ }
	%x{ service tomcat6 start }
	reply[:out] = 'ok, deployed.'
      end
    end
  end
end
