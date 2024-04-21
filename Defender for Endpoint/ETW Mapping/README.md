# Summary

This section provides a detailed mapping of the majority of the ActionTypes from Microsoft Defender for Endpoint (MDE) to the corresponding ETW Providers. The goal of this document is to assist other EDR researchers and developers in understanding how MDE uses ETW Providers to collect data for threat hunting.

| ActionType | Description | ETW Provider | Event ID |
|------------|-------------|--------------|----------|
| **`MemoryRemoteProtect`** | A process has modified the protection mask for a memory region used by another process. | Microsoft-Windows-ThreatIntelligence | 22 |
| **`DeviceBootAttestationInfo`** | N/A | N/A | N/A |
| **`DriverLoad`** | N/A | N/A | N/A |
| **`NtAllocateVirtualMemoryRemoteApiCall`** | Virtual Memory was allocated for a remote process | Microsoft-Windows-ThreatIntelligence | 21 |
| **`AccountCheckedForBlankPassword`** | An account was queried for a blank password. | Microsoft-Windows-Security-Auditing | 4797 |
| **`SecurityGroupCreated`** | An security group was created. | Microsoft-Windows-Security-Auditing | 4731 |
| **`ServiceInstalled`** | A service was installed. | Microsoft-Windows-Security-Auditing | 4697 |
| **`NetworkShareObjectAccessChecked`** | An attempt was made to access file or folder on a network share. | Microsoft-Windows-Security-Auditing | 5145 |
| **`NetworkShareObjectDeleted`** | A file or folder hosted on a network share was deleted. | Microsoft-Windows-Security-Auditing | 5144 |
| **`NetworkShareObjectModified`** | A file or folder hosted on a network share was modified. | Microsoft-Windows-Security-Auditing | 5143 |
| **`NetworkShareObjectAdded`** | A file or folder was shared on a network share. | Microsoft-Windows-Security-Auditing | 5142 |
| **`DirectoryServiceObjectCreated`** | An object was added to Active Directory. | Microsoft-Windows-Security-Auditing | 5137 |
| **`DirectoryServiceObjectModified`** | An object in Active Directory was modified. | Microsoft-Windows-Security-Auditing | 5136 |
| **`AntivirusEmergencyUpdatesInstalled`** | Emergency security intelligence updates for Windows Defender Antivirus were applied | Microsoft-Windows-Windows Defender | 2010 |
| **`AntivirusDefinitionsUpdateFailed`** | Security intelligence updates for Windows Defender Antivirus were not applied | Microsoft-Windows-Windows Defender | 2001 |
| **`DriverLoad`** | Description of ActionType3 | ETW Provider3 | EventID3 |
| **`DriverLoad`** | Description of ActionType3 | ETW Provider3 | EventID3 |
| **`DriverLoad`** | Description of ActionType3 | ETW Provider3 | EventID3 |
| **`DriverLoad`** | Description of ActionType3 | ETW Provider3 | EventID3 |
| **`DriverLoad`** | Description of ActionType3 | ETW Provider3 | EventID3 |
| **`DriverLoad`** | Description of ActionType3 | ETW Provider3 | EventID3 |
| **`DriverLoad`** | Description of ActionType3 | ETW Provider3 | EventID3 |
| **`DriverLoad`** | Description of ActionType3 | ETW Provider3 | EventID3 |
| **`DriverLoad`** | Description of ActionType3 | ETW Provider3 | EventID3 |
| **`DriverLoad`** | Description of ActionType3 | ETW Provider3 | EventID3 |
| **`DriverLoad`** | Description of ActionType3 | ETW Provider3 | EventID3 |
| **`DriverLoad`** | Description of ActionType3 | ETW Provider3 | EventID3 |
| **`DriverLoad`** | Description of ActionType3 | ETW Provider3 | EventID3 |
| **`DriverLoad`** | Description of ActionType3 | ETW Provider3 | EventID3 |
| **`DriverLoad`** | Description of ActionType3 | ETW Provider3 | EventID3 |
| **`DriverLoad`** | Description of ActionType3 | ETW Provider3 | EventID3 |
| **`DriverLoad`** | Description of ActionType3 | ETW Provider3 | EventID3 |
| **`DriverLoad`** | Description of ActionType3 | ETW Provider3 | EventID3 |
| **`DriverLoad`** | Description of ActionType3 | ETW Provider3 | EventID3 |
| **`DriverLoad`** | Description of ActionType3 | ETW Provider3 | EventID3 |
| **`DriverLoad`** | Description of ActionType3 | ETW Provider3 | EventID3 |
| **`DriverLoad`** | Description of ActionType3 | ETW Provider3 | EventID3 |
| **`DriverLoad`** | Description of ActionType3 | ETW Provider3 | EventID3 |
| **`DriverLoad`** | Description of ActionType3 | ETW Provider3 | EventID3 |


