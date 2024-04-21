# Summary

This section provides a detailed mapping of the majority of the ActionTypes from Microsoft Defender for Endpoint (MDE) to the corresponding ETW Providers. The goal of this document is to assist other EDR researchers and developers in understanding how MDE uses ETW Providers to collect data for threat hunting.

**DISCLAIMER:** I might have missed specific ActionTypes, so this in no means a "full list"

| ActionType | Description | ETW Provider | Event ID |
|------------|-------------|--------------|----------|
| **`MemoryRemoteProtect`** | A process has modified the protection mask for a memory region used by another process. | Microsoft-Windows-ThreatIntelligence | 22 |
| **`DeviceBootAttestationInfo`** | N/A | N/A | N/A |
| **`DriverLoad`** | N/A | N/A | N/A |
| **`NtAllocateVirtualMemoryRemoteApiCall`** | Virtual Memory was allocated for a remote process | Microsoft-Windows-ThreatIntelligence | 21 |
| **`AccountCheckedForBlankPassword`** | An account was queried for a blank password. | Microsoft-Windows-Security-Auditing | 4797 |
| **`SecurityGroupCreated`** | An security group was created. | Microsoft-Windows-Security-Auditing | 4731 |
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
| **`DriverLoad`** | Description of ActionType3 | ETW Provider3 | EventID3 |
| **`DriverLoad`** | Description of ActionType3 | ETW Provider3 | EventID3 |
| **`DriverLoad`** | Description of ActionType3 | ETW Provider3 | EventID3 |
| **`DriverLoad`** | Description of ActionType3 | ETW Provider3 | EventID3 |
| **`DriverLoad`** | Description of ActionType3 | ETW Provider3 | EventID3 |
| **`DriverLoad`** | Description of ActionType3 | ETW Provider3 | EventID3 |
| **`DriverLoad`** | Description of ActionType3 | ETW Provider3 | EventID3 |
| **`DriverLoad`** | Description of ActionType3 | ETW Provider3 | EventID3 |
| **`DriverLoad`** | Description of ActionType3 | ETW Provider3 | EventID3 |


