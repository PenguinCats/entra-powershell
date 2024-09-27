---
title: Get-EntraUser
description: This article provides details on the Get-EntraUser command.


ms.topic: reference
ms.date: 06/26/2024
ms.author: eunicewaweru
ms.reviewer: stevemutungi
manager: CelesteDG
author: msewaweru
external help file: Microsoft.Graph.Entra-Help.xml
Module Name: Microsoft.Graph.Entra
online version: https://learn.microsoft.com/powershell/module/Microsoft.Graph.Entra/Get-EntraUser

schema: 2.0.0
---

# Get-EntraUser

## Synopsis

Gets a user.

## Syntax

### GetQuery (Default)

```powershell
Get-EntraUser
 [-Filter <String>]
 [-All]
 [-Top <Int32>]
 [-Property <String[]>]
 [<CommonParameters>]
```

### GetByValue

```powershell
Get-EntraUser
 [-SearchString <String>]
 [-All]
 [-Property <String[]>]
 [<CommonParameters>]
```

### GetById

```powershell
Get-EntraUser
 -ObjectId <String>
 [-All]
 [-Property <String[]>]
 [<CommonParameters>]
```

## Description

The `Get-EntraUser` cmdlet gets a user from Microsoft Entra ID.

## Examples

### Example 1: Get top three users

```powershell
Connect-Entra -Scopes 'User.Read.All'
Get-EntraUser -Top 3
```

```Output
DisplayName      Id                                   Mail                  UserPrincipalName
-----------      --                                   ----                  -----------------
Angel Brown      cccccccc-2222-3333-4444-dddddddddddd AngelB@contoso.com    AngelB@contoso.com
Avery Smith      dddddddd-3333-4444-5555-eeeeeeeeeeee AveryS@contoso.com    AveryS@contoso.com
Sawyer Miller    eeeeeeee-4444-5555-6666-ffffffffffff SawyerM@contoso.com   SawyerM@contoso.com
```

This example demonstrates how to get top three users from Microsoft Entra ID.

### Example 2: Get a user by ID

```powershell
Connect-Entra -Scopes 'User.Read.All'
Get-EntraUser -ObjectId 'SawyerM@contoso.com'
```

```Output
DisplayName Id                                   Mail                                 UserPrincipalName
----------- --                                   ----                                 -----------------
Sawyer Miller bbbbbbbb-1111-2222-3333-cccccccccccc sawyerm@tenant.com sawyerm@tenant.com
```

This command gets the specified user.

- `-ObjectId` Specifies the ID as a user principal name (UPN) or ObjectId.

### Example 3: Search among retrieved users

```powershell
Connect-Entra -Scopes 'User.Read.All'
Get-EntraUser -SearchString 'New'
```

```Output
DisplayName        Id                                   Mail UserPrincipalName
-----------        --                                   ---- -----------------
New User88         bbbbbbbb-1111-2222-3333-cccccccccccc      demo99@tenant.com
New User           cccccccc-2222-3333-4444-dddddddddddd      NewUser@tenant.com
```

This cmdlet gets all users that match the value of SearchString against the first characters in DisplayName or UserPrincipalName.

### Example 4: Get a user by userPrincipalName

```powershell
Connect-Entra -Scopes 'User.Read.All'
Get-EntraUser -Filter "userPrincipalName eq 'SawyerM@contoso.com'"
```

```Output
DisplayName Id                                   Mail UserPrincipalName
----------- --                                   ---- -----------------
Sawyer Miller    cccccccc-2222-3333-4444-dddddddddddd      SawyerM@contoso.com
```

This command gets the specified user.

### Example 5: Get a user by MailNickname

```powershell
Connect-Entra -Scopes 'User.Read.All'
Get-EntraUser -Filter "startswith(MailNickname,'Ada')"
```

```Output
DisplayName     Id                                   Mail                                UserPrincipalName
-----------     --                                   ----                                -----------------
Mark Adams bbbbbbbb-1111-2222-3333-cccccccccccc Adams@contoso.com Adams@contoso.com
```

In this example, we retrieve all users whose MailNickname starts with Ada.

### Example 6: Get SignInActivity of a User

```powershell
Connect-Entra -Scopes 'User.Read.All','AuditLog.Read.All'
Get-EntraUser -ObjectId 'SawyerM@contoso.com' -Property 'SignInActivity' | Select-Object -ExpandProperty 'SignInActivity'
```

```Output
lastNonInteractiveSignInRequestId : bbbbbbbb-1111-2222-3333-aaaaaaaaaaaa
lastSignInRequestId               : cccccccc-2222-3333-4444-dddddddddddd
lastSuccessfulSignInDateTime      : 9/9/2024 1:12:13 PM
lastNonInteractiveSignInDateTime  : 9/9/2024 1:12:13 PM
lastSuccessfulSignInRequestId     : bbbbbbbb-1111-2222-3333-aaaaaaaaaaaa
lastSignInDateTime                : 9/7/2024 9:15:41 AM
```

This example demonstrates how to retrieve the SignInActivity of a specific user by selecting a property.

### Example 7: List users with disabled accounts

```powershell
Connect-Entra -Scopes 'User.Read.All'
Get-EntraUser -Filter "accountEnabled eq false" | Select-Object DisplayName, Id, Mail, UserPrincipalName
```

```Output
DisplayName        Id                                   Mail UserPrincipalName
-----------        --                                   ---- -----------------
New User           cccccccc-2222-3333-4444-dddddddddddd      NewUser@tenant.com
```

This example demonstrates how to retrieve all users with disabled accounts.

## Parameters

### -All

List all pages.

```yaml
Type: System.Management.Automation.SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -Filter

Specifies an OData v4.0 filter statement.
This parameter controls which objects are returned.
Details on querying with OData can be [found here](https://learn.microsoft.com/graph/aad-advanced-queries?tabs=powershell).

```yaml
Type: System.String
Parameter Sets: GetQuery
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: True (ByPropertyName, ByValue)
Accept wildcard characters: False
```

### -ObjectId

Specifies the ID (as a User Principal Name (UPN) or ObjectId) of a user in Microsoft Entra ID.

```yaml
Type: System.String
Parameter Sets: GetById
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByPropertyName, ByValue)
Accept wildcard characters: False
```

### -SearchString

Specifies a search string.

```yaml
Type: System.String
Parameter Sets: GetValue
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: True (ByPropertyName, ByValue)
Accept wildcard characters: False
```

### -Top

Specifies the maximum number of records to return.

```yaml
Type: System.Int32
Parameter Sets: GetQuery
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: True (ByPropertyName, ByValue)
Accept wildcard characters: False
```

### -Property

Specifies properties to be returned.

```yaml
Type: System.String[]
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters

This cmdlet supports the common parameters: `-Debug`, `-ErrorAction`, `-ErrorVariable`, `-InformationAction`, `-InformationVariable`, `-OutVariable`, `-OutBuffer`, `-PipelineVariable`, `-Verbose`, `-WarningAction`, and `-WarningVariable`. For more information, see [about_CommonParameters](https://go.microsoft.com/fwlink/?LinkID=113216).

## Inputs

## Outputs

## Notes

## Related Links

[New-EntraUser](New-EntraUser.md)

[Remove-EntraUser](Remove-EntraUser.md)

[Set-EntraUser](Set-EntraUser.md)
