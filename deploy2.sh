git clone https://github.com/YadiraF/PRNet
cd PRNet/Data/net-data
export AWS_ACCESS_KEY=AKIAIOSFODNN7EXAMPLE
export AWS_SECRET_KEY=wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY
mc config host add bucketport http://argo-artifacts-minio.default:9000 $AWS_ACCESS_KEY $AWS_SECRET_KEY
mc cp bucketport/3dfacebucket/256_256_resfcn256_weight.data-00000-of-00001 256_256_resfcn256_weight.data-00000-of-00001
cd ..
cd ..
mkdir inputdir
mkdir outputdir
cd inputdir
curl -o zach.jpg http://www.hairfunk.net/wp-content/uploads/2018/03/zac-efron-hairstyles-in-2018-zac-efron-hairstyles-48-fprznkv-14.jpg
curl -o bean.jpg https://i.imgur.com/5JYTVgv.jpg
curl -o sarah.jpg https://s.newsweek.com/sites/www.newsweek.com/files/styles/lg/public/2011/05/01/1337256000000.cached_11.jpg
curl -o sasha.jpg https://pmcvariety.files.wordpress.com/2018/07/sacha-baron-cohen.jpg 
cd ..
python run_basics.py
python demo.py -i inputdir -o outputdir --isDlib True
mc cp -r /notebooks/PRNet/outputdir bucketport/3dfacebucket/
