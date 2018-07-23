#!/bin/bash
apt-get update -y
apt-get install -y git vim sudo wget man gawk libgoogle-glog-dev libboost-all-dev python-numpy python-matplotlib cmake build-essential
echo "INSTALLING PIP"
mkdir -p ~/pip/
wget -O ~/pip/install.py https://bootstrap.pypa.io/get-pip.py
python ~/pip/install.py
rm -r ~/pip
pip install visvis imageio dlib
git clone https://github.com/YadiraF/PRNet
pip install -U scikit-image
cd PRNet/Data/net-data
curl -o 256_256_resfcn256_weight.data-00000-of-00001 https://github.com/EliZucker/Argo-Workflow-Test/blob/master/256_256_resfcn256_weight.data-00000-of-00001?raw=true -L
cd ..
cd ..
mkdir inputdir
mkdir outputdir
cd inputdir
curl -o zach.jpg http://www.hairfunk.net/wp-content/uploads/2018/03/zac-efron-hairstyles-in-2018-zac-efron-hairstyles-48-fprznkv-14.jpg
cd ..
python run_basics.py
python demo.py -i inputdir -o outputdir --isDlib True

curl -SO https://dl.minio.io/client/mc/release/linux-amd64/mc
chmod +x mc
mv mc /usr/local/bin/mc
export AWS_ACCESS_KEY=AKIAIOSFODNN7EXAMPLE
export AWS_SECRET_KEY=wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY
mc config host add bucketport http://argo-artifacts-minio.default:9000 $AWS_ACCESS_KEY $AWS_SECRET_KEY
mc cp -r /notebooks bucketport/3dfacebucket/