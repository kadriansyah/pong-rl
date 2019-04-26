# Please specify your Google Cloud Storage bucket here
# GCS_BUCKET="gs://my-bucket/"
GCS_BUCKET="gs://alobrain-ml-training/"
BUCKET=$GCS_BUCKET

TRAINER_PACKAGE_PATH="./trainer"
MAIN_TRAINER_MODULE="trainer.task"

now=$(date +"%Y%m%d_%H%M%S")
JOB_NAME="pong_$now"

JOB_DIR=$BUCKET$JOB_NAME

gcloud ml-engine jobs submit training $JOB_NAME \
    --job-dir $JOB_DIR \
    --package-path $TRAINER_PACKAGE_PATH \
    --module-name $MAIN_TRAINER_MODULE \
    --region asia-east1 \
    --config config.yaml \
    --runtime-version 1.10 \
    -- \
    --output-dir $BUCKET"pong_$now" \
    --learning-rate 0.0005 \
    --save-checkpoint-steps 10 \