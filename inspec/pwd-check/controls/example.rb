# encoding: utf-8
# copyright: 2018, The Authors

title 'Check password history is set to 24 or more passwords'

control "Check_password_history_is_set_to_24_or_more_passwords" do
  title "Check password history is set to 24 or more passwords"
  desc  "
    This policy setting determines the number of renewed, unique passwords that have to be associated with a user account before you can reuse an old password. The value for this policy setting must be between 0 and 24 passwords. The default value for Windows Vista is 0 passwords, but the default setting in a domain is 24 passwords. To maintain the effectiveness of this policy setting, use the Minimum password age setting to prevent users from repeatedly changing their password.
    
    The recommended state for this setting is: 24 or more password(s).
    
    Rationale: The longer a user uses the same password, the greater the chance that an attacker can determine the password through brute force attacks. Also, any accounts that may have been compromised will remain exploitable for as long as the password is left unchanged. If password changes are required but password reuse is not prevented, or if users continually reuse a small number of passwords, the effectiveness of a good password policy is greatly reduced.
    
    If you specify a low number for this policy setting, users will be able to use the same small number of passwords repeatedly. If you do not also configure the Minimum password age setting, users might repeatedly change their passwords until they can reuse their original password.
  "
  impact 1.0
  describe security_policy do
    its("PasswordHistorySize") { should be >= 24 }
  end
end
