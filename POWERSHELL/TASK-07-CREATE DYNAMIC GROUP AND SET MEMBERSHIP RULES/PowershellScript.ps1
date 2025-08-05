# Create Dynamic Group with Membership Rule

# 1. Connect to Microsoft Graph
Connect-MgGraph -Scopes "Group.ReadWrite.All", "User.Read.All"

# 2. Define Membership Rule
$membershipRule = '(user.department -eq "Marketing")'

# 3. Create Dynamic Security Group
New-MgGroup -DisplayName "Dynamic Group" `
    -MailNickname "DynamicGroupAlias" `
    -Description "Auto-managed group based on defined rule" `
    -MailEnabled:$false `
    -SecurityEnabled:$true `
    -GroupTypes @("DynamicMembership") `
    -MembershipRule $membershipRule `
    -MembershipRuleProcessingState "On"
