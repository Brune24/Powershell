# Sample script making use of a nested hashtable
Set a list of sw's compliant vlan IDs. Highlight every non-compliant / missing lines from a switch config file and generate a .json/.csv file looking like the table below.

| Switch Name |   VLAN ID |   Line 1 |         Line 2         | ... | 
|-------------|-----------|----------|------------------------|-----|
|     SW-1    |     987   | VLAN 988 | port hybrid tagged ... | ... |
|     SW-2    |     988   | VLAN 987 | port hybrid tagged ... | ... |
