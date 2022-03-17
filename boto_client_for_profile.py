"""
Functions that help setting boto clients based on local aws profile settings
Intended for use in local scripts
"""
import logging
import sys

import boto3
import botocore
from botocore.exceptions import ClientError, ProfileNotFound

def s3_client(aws_profile: str) -> botocore.client:
    """
    Set up an s3 client for the rd-interview-sample-data s3 bucket
    Using .aws profile `glob` to provide credentials
    """
    try:
        session = boto3.Session(profile_name=aws_profile)
    except Exception as error:
        logging.error(
            f"Check that aws_profile is set up for profile name '{aws_profile}'"
        )
        logging.error(error)
        sys.exit()
    s3_client = session.client("s3")
    return s3_client


def custom_boto_client(aws_profile: str, service: str) -> botocore.client:
    """
    Set up client for a boto service (eg: 's3')
    Using .aws profile present locally to provide credentials
    """
    try:
        session = boto3.Session(profile_name=aws_profile)
    except Exception as error:
        logging.error(
            f"Check that aws_profile is set up for profile name '{aws_profile}'"
        )
        logging.error(error)
        sys.exit()
    client = session.client(service)
    return client