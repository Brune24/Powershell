<#
Nested HashTables
    https://learn.microsoft.com/en-us/powershell/scripting/learn/deep-dives/everything-about-hashtable?view=powershell-7.3  
Add keys/values to hashtable
    https://stackoverflow.com/questions/46412764/powershell-hashtable-with-multiple-values-and-one-key
Collections type guidance    
    https://gist.github.com/kevinblumenfeld/4a698dbc90272a336ed9367b11d91f1c
Convert .json to .xlsx
    https://www.convertcsv.com/json-to-csv.htm
/#>

### non-compliant configurations ###
# Set sw's list and assigned vlan
$Switches = Import-Csv .\SW.csv
# Set nested hashtable
$MyHashtable = @{}
# Loop through switches array
foreach ($Item in $Switches){
    $Index = $Switches.IndexOf($Item)
    #echo $Item
    #echo $Index
    #pause
#}
    $Vlan = $Switches[$Index].Vlan
    #echo $Vlan
    $Switch = $Switches[$Index].Name
    #echo $Switch
    # Set global vlan search pattern
    $Pattern = "( 1)|( 2)|( 3)"
    # Update vlan search pattern
    $Pattern = $Pattern.Replace("|( $Vlan)","")
    $Pattern = $Pattern.Replace("( $Vlan)|","")
    #echo $Pattern
    #pause
#}
    # Populate nested hashtable
    $MyHashtable.$Switch = [ordered]@{}
    $MyHashtable.$Switch.'VLAN ID' =  $Vlan
    $MyHashtable.$Switch.LINES = $(cat ${Switch}* | Select-String -Pattern $Pattern)
}
# Export to json
$MyHashtable | ConvertTo-Json > SW.json
# Convert to .xlsx https://www.convertcsv.com/json-to-csv.htm

### Missing configurations ###
# Set sw's list and assigned vlan
$Switches = Import-Csv .\SW.csv
# Set nested hashtable
$MyHashtable = @{}
# Loop through switches array
foreach ($Item in $Switches){
    $Index = $Switches.IndexOf($Item)
    #echo $Item
    #echo $Index
    #pause
#}
    $Vlan = $Switches[$Index].Vlan
    #echo $Vlan
    $Switch = $Switches[$Index].Name
    #echo $Switch
    # Set global vlan search pattern
    $Pattern = "( $Vlan)"
    #$Pattern = "( 1)|( 2)|( 3)"
    # Update vlan search pattern
    #$Pattern = $Pattern.Replace("|( $Vlan)","")
    #$Pattern = $Pattern.Replace("( $Vlan)|","")
    #echo $Pattern
    #pause
#}
    # Populate nested hashtable
    $MyHashtable.$Switch = [ordered]@{}
    $MyHashtable.$Switch.'VLAN ID' =  $Vlan
    $MyHashtable.$Switch.LINES = $(cat ${Switch}* | Select-String -Pattern $Pattern)
}
# Export to json
$MyHashtable | ConvertTo-Json > SW2.json
# Convert to .xlsx https://www.convertcsv.com/json-to-csv.htm
