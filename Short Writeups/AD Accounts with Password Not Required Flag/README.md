# Summary

The *"PASSWD_NOTREQD"* flag is a specific attribute that can be set on user accounts. This attribute is part of the **`userAccountControl`** property, which is a bit field containing several flags that determine various settings and behaviors of user accounts.

The *"PASSWD_NOTREQD"* flag corresponds to the decimal value **`544`** within the **`userAccountControl`** attribute of an Active Directory user object. When this value is set, it indicates that the user account is allowed to exist without a password. This does not automatically remove a password if one exists but allows the account to have a blank password.

# Why might it be used in Active Directory?

The article explains that accounts with the *"PASSWD_NOTREQD"* flag often arise from identity management systems that fail to remove the flag after setting a password. Although the flag allows accounts to exist with blank passwords, it’s rare to find active accounts with blank passwords due to this issue. See: https://learn.microsoft.com/en-us/archive/blogs/russellt/passwd_notreqd
