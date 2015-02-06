#define RODS_SERVER 1

#include <cstddef>
#include "reFuncDefs.hpp"

#include "microservice.hpp"
#include "modAVUMetadata.hpp"


MICROSERVICE_BEGIN(
    msiSetAVU,
    STR, itemType, INPUT,
    STR, itemName, INPUT,
    STR, attrName, INPUT,
    STR, attrVal,  INPUT,
    STR, attrUnit, INPUT )

char op[]  = "set";

modAVUMetadataInp_t avuOp;
memset(&avuOp, 0, sizeof(avuOp));
avuOp.arg0 = op;
avuOp.arg1 = itemType;
avuOp.arg2 = itemName;
avuOp.arg3 = attrName;
avuOp.arg4 = attrVal;
avuOp.arg5 = attrUnit;

rei->status = rsModAVUMetadata(rei->rsComm, &avuOp);

RETURN(rei->status);

MICROSERVICE_END

