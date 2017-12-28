# pgrestore-s3

[![dockeri.co](http://dockeri.co/image/lgatica/pgrestore-s3)](https://hub.docker.com/r/lgatica/pgrestore-s3/)

[![Build Status](https://travis-ci.org/lgaticaq/pgrestore-s3.svg?branch=master)](https://travis-ci.org/lgaticaq/pgrestore-s3)

> Docker Image with Alpine Linux, pg_restore and awscli for restore postgres backup from s3

## Use

Restore database from backup 2017-11-26T02-00-00-0300.tar.gz in s3

```bash
docker run --rm \
  -e "POSTGRESQL_URI=postgres://user:pass@host:port/dbname"
  -e "BACKUP_NAME=2017-11-26T02-00-00-0300.tar.gz"
  -e "AWS_ACCESS_KEY_ID=your_aws_access_key"
  -e "AWS_SECRET_ACCESS_KEY=your_aws_secret_access_key"
  -e "S3_BUCKET=your_aws_bucket"
  lgatica/pgrestore-s3
```

## IAM Policity

You need to add a user with the following policies. Be sure to change `your_bucket` by the correct.

```xml
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "Stmt1412062044000",
            "Effect": "Allow",
            "Action": [
                "s3:PutObject",
                "s3:GetObject",
                "s3:PutObjectAcl"
            ],
            "Resource": [
                "arn:aws:s3:::your_bucket/*"
            ]
        },
        {
            "Sid": "Stmt1412062128000",
            "Effect": "Allow",
            "Action": [
                "s3:ListBucket"
            ],
            "Resource": [
                "arn:aws:s3:::your_bucket"
            ]
        }
    ]
}
```

## Related

- [pgdump-s3](https://github.com/lgaticaq/pgdump-s3)

## License

[MIT](https://tldrlegal.com/license/mit-license)
