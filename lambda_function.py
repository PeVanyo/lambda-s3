import json
import boto3
import logging
import mylib  # Importing the custom library from the Lambda Layer

# Set up logging
logger = logging.getLogger()
logger.setLevel(logging.INFO)

def lambda_handler(event, context):
    # Extract bucket name and file key from the event
    bucket_name = event['Records'][0]['s3']['bucket']['name']
    file_key = event['Records'][0]['s3']['object']['key']
    logger.info(f"Received event for bucket: {bucket_name}, key: {file_key}")

    # Initialize S3 client
    s3_client = boto3.client('s3')

    try:
        # Fetch file from S3
        file_obj = s3_client.get_object(Bucket=bucket_name, Key=file_key)
        file_content = file_obj['Body'].read().decode('utf-8')
        logger.info("File retrieved and read successfully.")

        # Process the file content using 'mylib' to count words
        word_count = mylib.count_words(file_content)
        logger.info(f"Word count: {word_count}")

        return {
            'statusCode': 200,
            'body': json.dumps(f'File processed successfully. Word count: {word_count}')
        }
    except Exception as e:
        logger.error(e)
        raise e