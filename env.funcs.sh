echo == DEFINE LAMBDA FUNCS == START

lambda_upload_zip () {
    aws lambda update-function-code --function-name testinghamFunc --zip-file fileb://`pwd`/$1
}

lambda_package () {
    rm -fr L2.zip D
    mkdir  D
    cp lambda_function.py D
    pip install -r requirements.txt -t D
    cd D
    zip ../L2.zip -r *
    cd ..
    lambda_upload_zip L2.zip
}

aws_test () {
    aws lambda invoke --function-name testinghamFunc --payload '{"key3":"","key1":"ONE","key2":""}' --invocation-type=RequestResponse --log-type=Tail OUTFILE
}

echo == DEFINE LAMBDA FUNCS == STOP
