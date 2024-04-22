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
| **`AntivirusDefinitionsUpdated`** | Security intelligence updates for Windows Defender Antivirus were applied successfully. | Microsoft-Windows-Windows Defender | 2000 |
| **`UserAccountModified`** | A user account was changed. | Microsoft-Windows-Security-Auditing | 4738 |
| **`SecurityGroupDeleted`** | A security-enabled local group was deleted. | Microsoft-Windows-Security-Auditing | 4734 |
| **`UserAccountRemovedFromLocalGroup`** | A member was removed from a security-enabled local group. | Microsoft-Windows-Security-Auditing | 4733 |
| **`UserAccountAddedToLocalGroup`** | A member was added to a security-enabled local group. | Microsoft-Windows-Security-Auditing | 4732 |
| **`UserAccountDeleted`** | A user account was deleted. | Microsoft-Windows-Security-Auditing | 4726 |
| **`AntivirusError`** | Windows Defender Antivirus encountered an error while taking action on malware | Microsoft-Windows-Windows Defender | 1119 |
| **`AntivirusMalwareActionFailed`** | Windows Defender Antivirus attempted to take action on malware but it failed | Microsoft-Windows-Windows Defender | 1118 |
| **`AntivirusMalwareBlocked`** | Windows Defender Antivirus blocked files or activity involving malware potentially unwanted applications or suspicious behavior. | Microsoft-Windows-Windows Defender | 1117 |
| **`AntivirusDetection`** | Windows Defender Antivirus detected a threat. | Microsoft-Windows-Windows Defender | 1116 |
| **`SecurityLogCleared`** | The security log was cleared. | Microsoft-Windows-Security-Auditing | 1102 |
| **`PnpDeviceConnected`** | A plug and play (PnP) device was attached. | Microsoft-Windows-Security-Auditing | 6416 |
| **`PnpDeviceAllowed`** | Device control allowed a trusted plug and play (PnP) device.| Microsoft-Windows-Kernel-PnP-Events | 400 |
| **`PnpDeviceBlocked`** | Device control blocked an untrusted plug and play (PnP) device. | Microsoft-Windows-Kernel-PnP-Events | 402 |
| **`ScreenshotTaken`** | A screenshot was taken. | Microsoft-Windows-Win32k | 1 |
| **`ScheduledTaskCreated`** | 	A scheduled task was created. | Microsoft-Windows-Security-Auditing | 4698 |
| **`ScheduledTaskDeleted`** | A scheduled task was deleted. | Microsoft-Windows-Security-Auditing | 4699 |
| **`ScheduledTaskEnabled`** | A scheduled task was turned on. | Microsoft-Windows-Security-Auditing | 4700 |
| **`ScheduledTaskDisabled`** | A scheduled task was turned off. | Microsoft-Windows-Security-Auditing | 4701 |
| **`OpenProcessApiCall`** | The OpenProcess function was called indicating an attempt to open a handle to a local process and potentially manipulate that process. | Microsoft-Windows-SEC | 19 |
| **`CreateRemoteThreadApiCall`** | A thread that runs in the virtual address space of another process was created. | Microsoft-Windows-SEC | 18 |
| **`AppControlExecutableAudited`** | Application control detected the use of an untrusted executable. | Microsoft-Windows-AppLocker | 8003 |
| **`AppControlExecutableBlocked`** | Application control blocked the use of an untrusted executable. | Microsoft-Windows-AppLocker | 8004 |
| **`AppControlScriptAudited`** | Application control detected the use of an untrusted script. | Microsoft-Windows-AppLocker | 8006 |


