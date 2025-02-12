import json
import os
import base64
import urllib3

def lambda_handler(event, context):
    url = "https://bc1yy8dzsg.execute-api.eu-west-1.amazonaws.com/v1/data"
    headers = {
        "Content-Type": "application/json",
        "X-Siemens-Auth": "test"
    }
    
    payload = {
        "subnet_id": os.getenv("SUBNET_ID"),
        "name": os.getenv("FULL_NAME"),
        "email": os.getenv("EMAIL")
    }
    
    http = urllib3.PoolManager()
    response = http.request("POST", url, body=json.dumps(payload), headers=headers)
    
    log_result = {
        "status_code": response.status,
        "response_data": response.data.decode("utf-8")
    }
    
    print(json.dumps(log_result, indent=2))
    return log_result

