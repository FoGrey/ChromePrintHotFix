Made this while on helpdesk while we were migrating to new print servers. Chrome as a bad habit of caching printers to %appdata%/not going off of currently installed system printers.
https://superuser.com/questions/944441/web-page-crashes-when-attempting-to-print-on-google-chrome

The solution online is to remove the Chrome user data/preferences folder in %appdata%.
Example: $env:LOCALAPPDATA\Google\Chrome\User Data\Default\Preferences

This script changes the preferences file/removes those cached printers. 
