ACR_NAME='wspsdemoacr'
ACR_REGISTRY_ID=$(az acr show --name $ACR_NAME --query id --output tsv)

SP_NAME=acr-service-principal
SP_PASSWD=$(az ad sp create-for-rbac \
    --name http://$ACR_NAME-pull \
    --scopes $ACR_REGISTRY_ID \
    --role acrpull \
    --query password \
    --output tsv)

#UPDATE 11 JAN 21 - --name has been deprecated by azure cli and now uses display name. 
SP_APPID=$(az ad sp list \
    --display-name http://$ACR_NAME-pull \
    --query '[].appId' \
    --output tsv)