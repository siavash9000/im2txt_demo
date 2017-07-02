if [ $# -eq 0 ]
then 
  echo "path or url to image is missing"
  echo "example: ./process_image.sh imgs/bikes.jpg"
  echo "example: ./process_image.sh https://github.com/tensorflow/models/raw/master/im2txt/g3doc/COCO_val2014_000000224477.jpg"
  exit 3
fi

INPUTFILE=$1
echo $INPUTFILE | grep '^https\{0,1\}://'
if [ $? -eq 0 ]
then
  TMPFILE="imgs/$(cat /proc/sys/kernel/random/uuid).jpg"
  wget -nv -O $TMPFILE "$INPUTFILE"
  INPUTFILE=$TMPFILE
fi

echo "Processing $INPUTFILE"

# Run inference to generate captions.¬
im2txt/bazel-bin/im2txt/run_inference --checkpoint_path="/root/im2txt_pretrained/model.ckpt-2000000" --vocab_file="/root/im2txt_pretrained/word_counts.txt" --input_files="$INPUTFILE"

if [ -v TMPFILE ]
then
  echo "Removing tmp file $TMPFILE"
  rm "$TMPFILE"
fi
