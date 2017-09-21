#!/bin/bash
#cd /opt/superdesk/client-core &&
#npm link &&
#npm link superdesk-core &&
#cd /opt/superdesk/client &&
cd /opt/superdesk/client/dist &&
sed -i \
 -e "s/http:\/\/localhost:5000\/api/$(echo $SUPERDESK_URL | sed 's/\//\\\//g')/g" \
 -e "s/ws:\/\/localhost:5100/$(echo $SUPERDESK_WS_URL | sed 's/\//\\\//g')/g" \
 -e "s/ws:\/\/0.0.0.0:5100/$(echo $SUPERDESK_WS_URL | sed 's/\//\\\//g')/g" \
 -e 's/iframely:{key:""}/iframely:{key:"'$IFRAMELY_KEY'"}/g' \
 app*.js &&
nginx &
#npm install grunt &&
#grunt server --server='http://ec2-18-220-2-159.us-east-2.compute.amazonaws.com:5000/api' --ws='ws://ec2-18-220-2-159.us-east-2.compute.amazonaws.com:5100' &

cd /opt/superdesk &&
bash ./scripts/fig_wrapper.sh honcho start
