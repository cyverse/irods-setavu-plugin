# irods-setavu-plugin

An iRODS plugin that provides a microservice for setting AVUs. Currently, this
plugin can run in the CentOS 6 and 7 versions of iRODS 4.1.10.


## Usage

The microservice `msiSetAVU` assigns an AVU to a collection, data object,
resource, or user. It returns 0 on success and something else on failure.

```
int msiSetAVU(msParam_t*      itemTypeInParam,
              msParam_t*      itemNameInParam,
              msParam_t*      attrNameInParam,
              msParam_t*      attrValInParam,
              msParam_t*      attrUnitInParam,
              ruleExecInfo_t* rei
             )
```


### Parameters

Type   | Name              | Description
------ | ----------------- | -----------
in     | `itemTypeInParam` | a `STR_MS_T` containing the type of item being given an AVU: `-c` for collection, `-d` for data object, `-r` for resource, and `-u` for user
in     | `itemNameInParam` | a `STR_MS_T` containing the name of the item being given an AVU
in     | `attrNameInParam` | a `STR_MS_T` containing the attribute name to be assigned
in     | `attrValInParam`  | a `STR_MS_T` containing the attribute value to be assigned
in     | `attrUnitInParam` | a `STR_MS_T` containing the attribute unit to be assigned
in,out | `rei`             | the `RuleExecInfo` structure that is automatically handled by the rule engine, should not be included as a parameter in the rule invocation.

### Example

```
acPostProcForPut {
  if ($writeFlag == 0) {
    msiSetAVU('-d', $objPath, 'UploadingProxyUser', $userNameProxy, '');
  }
}
```

## Compilation

For each OS specific version of the plugin, a shared object `libmsiSetAVU.so` is
build inside an OS specific docker container. To build the object, just run the
`build` executable. The resulting objects will be subdirectories of the
`libraries/` directory named at the OSes they are intended for. Here's an
example build.

```
? ./build

? tree librarieslibraries
├── centos6
│   └── libmsiSetAVU.so
└── centos7
    └── libmsiSetAVU.so

2 directories, 2 files
```
