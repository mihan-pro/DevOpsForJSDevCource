# prepare beckend part 
cd /Users/Mikhail_Proshin/work/nestjs-rest-api;
npm run build;
# prepeare frontend part
cd /Users/Mikhail_Proshin/work/shop-react-redux-cloudfront/
rm -rf ./dist;
npm run build;
# clear data
ssh 13.53.61.166;
rm /var/www/html/*;
rm -rf /home/ubuntu/nestjs-rest-api;
exit;
# transfer data
scp /Users/Mikhail_Proshin/work/nestjs-rest-api ubuntu@13.53.61.166:/home/ubuntu;
scp /Users/Mikhail_Proshin/work/shop-react-redux-cloudfront/dist ubuntu@13.53.61.166:/var/www/html
# run new version
ssh 13.53.61.166;
cd /home/ubuntu/nestjs-rest-api;
npm run buld;
pm2 delete main
pm2 start ./dist/main.js;
systemctl restart nginx;
