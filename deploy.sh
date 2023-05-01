# prepare beckend part 
cd /Users/Mikhail_Proshin/work/nestjs-rest-api;
npm run build;
# prepeare frontend part
cd /Users/Mikhail_Proshin/work/shop-react-redux-cloudfront/
rm -rf ./dist;
npm run build;
# clear data
ssh ubuntu@13.53.61.166 'sudo rm -rf /var/www/html/*'
ssh ubuntu@13.53.61.166 'sudo rm -rf /home/ubuntu/nestjs-rest-api'
# transfer data
scp -r /Users/Mikhail_Proshin/work/nestjs-rest-api ubuntu@13.53.61.166:/home/ubuntu;
scp -r /Users/Mikhail_Proshin/work/shop-react-redux-cloudfront/dist ubuntu@13.53.61.166:/var/www/html
# run new version
ssh ubuntu@13.53.61.166 'cd /home/ubuntu/nestjs-rest-api;npm run buld;pm2 delete main';
ssh ubuntu@13.53.61.166 'pm2 start ./nestjs-rest-api/dist/main.js; sudo systemctl restart nginx;'
