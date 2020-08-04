Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass

Import-AzBlueprintWithArtifact -Name 'bp-rl-demo-dev-prereq' -SubscriptionId 'b0103275-aec3-488d-a5fb-404e22f47fb5' -InputPath D:\blueprints\dev\bp-rl-demo-dev-prereq

$bp = Get-AzBlueprint -Name bp-rl-demo-dev-prereq -SubscriptionId 'b0103275-aec3-488d-a5fb-404e22f47fb5'

Publish-AzBlueprint -Blueprint $bp -Version 1.0

New-AzBlueprintAssignment -Blueprint $bp -Name 'bp-rl-demo-dev-prereq' -Location 'centralus'

