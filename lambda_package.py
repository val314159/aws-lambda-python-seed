from __future__ import print_function

import json,boto3,requests,smart_open

def lambda_handler(event, context):
    sqs = boto3.resource('sqs')
    queue = sqs.get_queue_by_name(QueueName='testingham')
    response = queue.send_message(MessageBody=json.dumps(event))
    print("the response:", response)
    print("Received event: " + json.dumps(event, indent=2))
    print("xvalue1 = " + event['key1'])
    print("xvalue2 = " + event['key2'])
    print("xvalue3 = " + event['key3'])
    return "R+SO+2.!---aha!!----!!!.1X"+event['key1']  # Echo back the first key value
