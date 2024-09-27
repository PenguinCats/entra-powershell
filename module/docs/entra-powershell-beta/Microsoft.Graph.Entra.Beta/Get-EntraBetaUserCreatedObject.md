---
title: Get-EntraBetaUserCreatedObject
description: This article provides details on the  Get-EntraBetaUserCreatedObject Command.

ms.topic: reference
ms.date: 07/25/2024
ms.author: eunicewaweru
ms.reviewer: stevemutungi
manager: CelesteDG
author: msewaweru

external help file: Microsoft.Graph.Entra.Beta-Help.xml
Module Name: Microsoft.Graph.Entra.Beta
online version: https://learn.microsoft.com/powershell/module/Microsoft.Graph.Entra.Beta/Get-EntraBetaUserCreatedObject

schema: 2.0.0
---

# Get-EntraBetaUserCreatedObject

## Synopsis

Get objects created by the user.

## Syntax

```powershell
Get-EntraBetaUserCreatedObject
 -ObjectId <String>
 [-All]
 [-Top <Int32>]
 [<CommonParameters>]
```

## Description

The `Get-EntraBetaUserCreatedObject` cmdlet gets objects created by a user in Microsoft Entra ID.

## Examples

### Example 1: Get a user-created object

```powershell
Connect-Entra -Scopes 'User.Read','User.Read.All'
Get-EntraBetaUserCreatedObject -ObjectId 'SawyerM@contoso.com'
```

```Output
Id                                   DeletedDateTime
--                                   ---------------
bbbbbbbb-1111-2222-3333-cccccccccccc
cccccccc-2222-3333-4444-dddddddddddd
dddddddd-3333-4444-5555-eeeeeeeeeeee
eeeeeeee-4444-5555-6666-ffffffffffff
```

This example retrieves an object created by the specified user.

- `-ObjectId` parameter specifies the object Id of a user(as a UserPrincipalName or ObjectId).

### Example 2: Get all user-created objects

```powershell
Connect-Entra -Scopes 'User.Read','User.Read.All'
Get-EntraBetaUserCreatedObject -ObjectId 'SawyerM@contoso.com' -All
```

```Output
Id                                   DeletedDateTime
--                                   ---------------
bbbbbbbb-1111-2222-3333-cccccccccccc
cccccccc-2222-3333-4444-dddddddddddd
dddddddd-3333-4444-5555-eeeeeeeeeeee
eeeeeeee-4444-5555-6666-ffffffffffff
```

This example retrieves all objects created by the specified user.

- `-ObjectId` parameter specifies the object Id of a user(as a UserPrincipalName or ObjectId).

### Example 3: Get a top one user-created object

```powershell
Connect-Entra -Scopes 'User.Read','User.Read.All'
Get-EntraBetaUserCreatedObject -ObjectId 'SawyerM@contoso.com' -Top 1
```

```Output
Id                                   DeletedDateTime
--                                   ---------------
bbbbbbbb-1111-2222-3333-cccccccccccc
```

This example retrieves top one object created by the specified user.

- `-ObjectId` parameter specifies the object Id of a user(as a UserPrincipalName or ObjectId).

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

### -ObjectId

Specifies the ID (as a UserPrincipalName or ObjectId) of a user in Microsoft Entra ID.

```yaml
Type: System.String
Parameter Sets: (All)
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByPropertyName, ByValue)
Accept wildcard characters: False
```

### -Top

Specifies the maximum number of records to return.

```yaml
Type: System.Int32
Parameter Sets: (All)
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
