# Auto-Permanent-Login-using-Cookies

Use this if you would like your system users to remain logged in permanently (assuming they've chosen to do so) instead of being logged out after their session has expired.

This code works on the assumption that a system is in a logged in state if the session.user.id value is not the default value 0.

Summarised process is a follows;
1. Within onRequestStart the code will check if session has expired.
2. If session has expired then check if there is a `CLIENT.auth_token` variable
3. decrypt the `CLIENT.auth_token` variable and if a valid user_id is found set this in the session.

 Encryption is currently 3DES but can be easily change to AES or whatever is preferable
