control 'PHTN-40-000042' do
  title 'The Photon operating systems must enforce a 90-day maximum password lifetime restriction.'
  desc 'Any password, no matter how complex, can eventually be cracked. Therefore, passwords need to be changed periodically. If the operating system does not limit the lifetime of passwords and force users to change their passwords, there is the risk that the operating system passwords could be compromised.'
  desc 'check', %q(At the command line, run the following command to verify a 90-day maximum password lifetime restriction:

# grep '^PASS_MAX_DAYS' /etc/login.defs

If "PASS_MAX_DAYS" is not set to <= 90, is missing or commented out, this is a finding.
If "PASS_MAX_DAYS" is disabled or set to -1, this is a finding.)
  desc 'fix', 'Navigate to and open:

/etc/login.defs

Add or update the following line:

PASS_MAX_DAYS 90'
  impact 0.5
  tag check_id: 'C-62561r1003635_chk'
  tag severity: 'medium'
  tag gid: 'V-258821'
  tag rid: 'SV-258821r1003636_rule'
  tag stig_id: 'PHTN-40-000042'
  tag gtitle: 'SRG-OS-000076-GPOS-00044'
  tag fix_id: 'F-62470r933523_fix'
  tag cci: ['CCI-004066']
  tag nist: ['IA-5 (1) (h)']

  describe login_defs do
    its('PASS_MAX_DAYS') { should cmp <= '90' }
    its('PASS_MAX_DAYS') { should cmp >= 0 }
  end
end