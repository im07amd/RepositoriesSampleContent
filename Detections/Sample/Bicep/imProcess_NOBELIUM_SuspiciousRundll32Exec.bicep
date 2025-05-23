param workspace string

@description('Unique id for the scheduled alert rule')
@minLength(1)
param analytic_id string = 'c62d2a2f-1820-4030-86cc-a6dd2cdb7559'

resource workspace_Microsoft_SecurityInsights_analytic_id 'Microsoft.OperationalInsights/workspaces/providers/alertRules@2020-01-01' = {
  name: '${workspace}/Microsoft.SecurityInsights/${analytic_id}'
  kind: 'Scheduled'
  location: resourceGroup().location
  properties: {
    description: 'This query idenifies when rundll32.exe executes a specific set of inline VBScript commands\nReferences: https://www.microsoft.com/security/blog/2021/03/04/goldmax-goldfinder-sibot-analyzing-nobelium-malware/\nTo use this analytics rule, make sure you have deployed the [ASIM normalization parsers](https://aka.ms/AzSentinelProcessEvent)'
    displayName: 'NOBELIUM - suspicious rundll32.exe execution of vbscript (Normalized Process Events)'
    enabled: false
    query: 'imProcessCreate\n| where Process hassuffix \'rundll32.exe\'\n| where CommandLine  has_any (\'Execute\',\'RegRead\',\'window.close\')\n| project TimeGenerated, Dvc, User, Process, CommandLine, ActingProcessName, EventVendor, EventProduct\n| extend timestamp = TimeGenerated, HostCustomEntity = Dvc, AccountCustomEntity = User\n'
    queryFrequency: 'P1D'
    queryPeriod: 'P1D'
    severity: 'Medium'
    suppressionDuration: 'PT1H'
    suppressionEnabled: false
    triggerOperator: 'GreaterThan'
    triggerThreshold: 0
    tactics: [
      'Persistence'
    ]
  }
}
