# These scripts are intended to check performance of dhis application using apache benchmark tool

## **System requirements:**
  ```
  Node
  ```
## What config.json contains??
It contains three keys **dataElementId**, **orgUnitId**, **period**. You have to configure values for these keys.
### To get dataElementId value:
  * **http://{url_here}/api/dataElements?filter=valueType:eq:INTEGER_POSITIVE&paging=false.**
  * This api gives response of all the data elements of type positive integer present in the dhis system along with ids.
  * You can use any id as a value for dataElementId key.
### To get org unitId value:
  * **http://{url_here}/api/organisationUnits?paging=false.**
  * This api gives response of all the org units present in the system along with ids.
  * You can use any id as a value for orgUnitId key.
### To get period value:
  * Give period only in Year format Ex: 2016 for period key

## What config.sh contains??
  * config.sh file where you configure target application details.
  * It contains target url, port,username,password of dhis application.
  * **NOTE:** Create one dummy test user at the server use that test user creds here to test application.

## What dataValuesGeneratedScrips does???
  * Once you configured the config.json file. Run this script using node.
  ```
  Ex: node dataValuesGeneratedScript.js
```
 * After you run this script, it generates the dataValues.json file.
 * All the scripts in under scripts/ folder will use this json file to post data to dhis.

## How to run scripts:
 * **NOTE:** Before you run any script you have configure both config.json and config.sh files.
 * All scripts are located under scripts/ folder.

### how to run concurrent_read.sh
 * To run this script You have to pass two command line params one is number of requests and second one is number of concurrent users.
 ```
Ex: ./concurrent_read.sh 15 10 (Make sure number requests should always greater than number of users).
```
### how to run concurrent_read_write.sh
* **NOTE:** Before you run the script, you need to run dataValuesGeneratedScript.
* Same as the above command. But it posts the dataValues.json file to dhis.
  ```
  Ex: ./concurrent_read_write.sh 15 10
  ```

#### how to run export_anlaytics.sh
* **NOTE:** 
  * Before you run the script, you have configure config.json file and give different value for dataElementId as mentioned in     the **To get dataElementId** value section. 
  * run ```node node dataValuesGeneratedScript.js``` to get differnt dataValues json to post.
* Same as the above command.
```
Ex: ./export_analytics.sh 15 10
```
### how to run metadata_sync.sh
* **NOTE:** Before you run the script, you should have atleast one version present in the target dhis system.
* Same as the above command.
```
Ex: ./metadata_Sync.sh 15 10
```


