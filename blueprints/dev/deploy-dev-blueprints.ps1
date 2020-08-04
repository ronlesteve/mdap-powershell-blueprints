Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass

Import-AzBlueprintWithArtifact -Name 'bp-rl-demo-dev-prereq' -SubscriptionId 'b0103275-aec3-488d-a5fb-404e22f47fb5' -InputPath D:\blueprints\dev\bp-rl-demo-dev-prereq

$bp = Get-AzBlueprint -Name bp-rl-demo-dev-prereq -SubscriptionId 'b0103275-aec3-488d-a5fb-404e22f47fb5'

Publish-AzBlueprint -Blueprint $bp -Version 1.0

New-AzBlueprintAssignment -Blueprint $bp -Name 'bp-rl-demo-dev-prereq' -Location 'centralus'

Set-AzKeyVaultAccessPolicy -VaultName 'rl-akv-demo001-dev' -UserPrincipalName 'ronlesteve@gmail.com' -PermissionsToSecrets get,set,delete

$secretvalue = ConvertTo-SecureString 'Demo321' -AsPlainText -Force
$secret = Set-AzKeyVaultSecret -VaultName 'rl-akv-demo001-dev' -Name 'adminPassword' -SecretValue $secretvalue

$secretvalue = ConvertTo-SecureString 'rladmin' -AsPlainText -Force
$secret = Set-AzKeyVaultSecret -VaultName 'rl-akv-demo001-dev' -Name 'adminLoginUser' -SecretValue $secretvalue

Import-AzBlueprintWithArtifact -Name 'bp-rl-demo-dev-master' -SubscriptionId 'b0103275-aec3-488d-a5fb-404e22f47fb5' -InputPath D:\blueprints\dev\bp-rl-demo-dev-master

$bp = Get-AzBlueprint -Name bp-rl-demo-dev-master -SubscriptionId 'b0103275-aec3-488d-a5fb-404e22f47fb5'

Publish-AzBlueprint -Blueprint $bp -Version 1.0

New-AzBlueprintAssignment -Blueprint $bp -Name 'bp-rl-demo-dev-master' -Location ‘centralus’