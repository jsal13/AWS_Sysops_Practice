# AWS CLI
## Useful Commands
Query all AMIs with architecture 64bit and platform Linux/UNIX and the image location contains `us-east-1`.  Additionally, we require the description to contain our Amazon Linux 2 Kernel text.
```bash
aws ec2 describe-images --owners self amazon --query 'Images[?(Architecture==`x86_64` && PlatformDetails==`Linux/UNIX` && contains(ImageLocation, `us-east-1`) && contains(Description, `Amazon Linux 2 Kernel`) == `true`)]'
```

Similar deal with filters.
```bash
aws ec2 describe-images --owners amazon --filters "Name=root-device-type,Values=ebs" "Name=architecture,Values=x86_64"
```

Querying after a filter.
```bash
aws ec2 describe-images --owners amazon --filters "Name=root-device-type,Values=ebs" "Name=architecture,Values=x86_64" --query "Images[?(contains(Name,`Amazon`))]"
```

Querying with yet another way to filter.  Uses flags.
```bash
aws ec2 describe-images --owners amazon --region us-east-1 --query "Images[?(contains(Name, '*Linux*'))] | [:3]"
```

Using the date sorter.
```bash
aws ec2 describe-images --owners amazon --region us-east-1 --filter "Name=description,Values=Amazon Linux 2 Kernel*" --query "sort_by(Images,&CreationDate)[-1]"
```

FInally, using the name thing to get the info we want back:
```bash
 aws ec2 describe-images --owners amazon --region us-east-1 --filter "Name=description,Values=Amazon Linux 2 Kernel*" --query "sort_by(Images,&CreationDate)[-1].{id:ImageId,date:CreationDate}"

[Out]
{
    "id": "ami-03ededff12e34e59e",
    "date": "2022-04-11T18:52:07.000Z"
}

```

Use `jq` to parse the json and get our value.  Note here that `-r` is "raw" which gives us no quotes around the output.
```bash
aws ec2 describe-images --owners amazon --region us-east-1 --filter "Name=description,Values=Amazon Linux 2 Kernel*" --query "sort_by(Images,&CreationDate)[-1].{id:ImageId,date:CreationDate}" | jq -r .id

[Out]
ami-03ededff12e34e59e
```
