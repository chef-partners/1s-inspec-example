# encoding: utf-8
# copyright: 2018, The Authors

title 'SSH version 2 is installed'

control "Set_SSH_Protocol_to_2" do
  title "Set SSH Protocol to 2"
  desc  "
    SSH supports two different and incompatible protocols: SSH1 and SSH2. SSH1 was the original protocol and was subject to security issues. SSH2 is more advanced and secure.
    
    Rationale: SSH v1 suffers from insecurities that do not affect SSH v2.
  "
  impact 1.0
  describe file("/etc/ssh/sshd_config") do
    its("content") { should match(/^\s*Protocol\s+(\S+)\s*(?:#.*)?$/) }
  end
  file("/etc/ssh/sshd_config").content.to_s.scan(/^\s*Protocol\s+(\S+)\s*(?:#.*)?$/).flatten.each do |entry|
    describe entry do
      it { should eq "2" }
    end
  end
end
