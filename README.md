## AWS related helper functions


Note - [AWS profile](https://boto3.amazonaws.com/v1/documentation/api/latest/guide/credentials.html#shared-credentials-file) needs to be set up for the script to access aws services

eg: 

`.aws/config`

```
[glob]
region = eu-west-2
output = json
```

`.aws/credentials`

```
[glob]
aws_access_key_id = <your access key>
aws_secret_access_key = <your secret access key>
```