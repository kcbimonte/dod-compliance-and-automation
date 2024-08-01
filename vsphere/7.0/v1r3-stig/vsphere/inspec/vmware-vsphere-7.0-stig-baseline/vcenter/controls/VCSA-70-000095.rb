control 'VCSA-70-000095' do
  title 'The vCenter Server users must have the correct roles assigned.'
  desc 'Users and service accounts must only be assigned privileges they require. Least privilege requires that these privileges must only be assigned if needed to reduce risk of confidentiality, availability, or integrity loss.

'
  desc 'check', 'From the vSphere Client, go to Administration >> Access Control >> Roles.

View each role and verify the users and/or groups assigned to it by clicking "Usage".

or

From a PowerCLI command prompt while connected to the vCenter server, run the following command:

Get-VIPermission | Sort Role | Select Role,Principal,Entity,Propagate,IsGroup | FT -Auto

Application service account and user required privileges should be documented.

If any user or service account has more privileges than required, this is a finding.'
  desc 'fix', %q(To update a user's or group's permissions to an existing role with reduced permissions, do the following:

From the vSphere Client, go to Administration >> Access Control >> Global Permissions.

Select the user or group, click the pencil button, change the assigned role, and click "OK".

Note: If permissions are assigned on a specific object, the role must be updated where it is assigned (for example, at the cluster level).

To create a new role with reduced permissions, do the following:

From the vSphere Client, go to Administration >> Access Control >> Roles.

Click the green plus sign and enter a name for the role and select only the specific permissions required.

Users can then be assigned to the newly created role.)
  impact 0.5
  tag check_id: 'C-60010r885614_chk'
  tag severity: 'medium'
  tag gid: 'V-256335'
  tag rid: 'SV-256335r885616_rule'
  tag stig_id: 'VCSA-70-000095'
  tag gtitle: 'SRG-APP-000211'
  tag fix_id: 'F-59953r885615_fix'
  tag satisfies: ['SRG-APP-000211', 'SRG-APP-000233', 'SRG-APP-000380']
  tag cci: ['CCI-001082', 'CCI-001084', 'CCI-001813']
  tag nist: ['SC-2', 'SC-3', 'CM-5 (1) (a)']

  describe 'This check is a manual or policy based check' do
    skip 'This must be reviewed manually'
  end
end