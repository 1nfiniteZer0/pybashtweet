# This file requires that you have made a twitter app for this
# Go to apps.twitter.com and sign in with your account. Create a Twitter application
# and go to Keys and Tokens. Generate a Consumer Key, Consumer Secret,
# Access Token, and Access Token Secret.

# By: Aidan Biggs
# AKA AT Vloggers
# 
# Please do not claim this as your own.
# 
# If you remove this it means you break the Code of Use found here: 
# https://at-vloggers.weebly.com/code-of-use.html

saveinfo(){
	echo $ckey >>creds1.txt
	echo $csecret >> creds2.txt
	echo $atoken >>creds3.txt
	echo $asecret >> creds4.txt
}
readthefile(){
	ckey=`cat creds1.txt`
	csecret=`cat creds2.txt`
	atoken=`cat creds3.txt`
	asecret=`cat creds4.txt`
}
if [[ $1 == "deletesaved" ]]
then
	sudo rm creds1.txt
	sudo rm creds2.txt
	sudo rm creds3.txt
	sudo rm creds4.txt
	echo DELETED SAVED CREDS
	exit 0
else
echo ---
fi
echo This file requires that you have
echo made a twitter app for this
echo Go to apps.twitter.com and sign in
echo with your account. Create a Twitter application
echo and go to Keys and Tokens.
echo Generate a Consumer Key, Consumer Secret,
echo Access Token, and Access Token Secret.
# Installs tweepy
sudo pip install tweepy

# Deletes previous tweet python file
sudo rm tweet.py

# Gets Twitter app info
if [ -e creds1.txt ]
then
	readthefile
else
clear
echo Consumer API Key-
read ckey
clear
echo Consumer API Secret Key-
read csecret
clear
echo Access Token-
read atoken
clear
echo Access Token Secret-
read asecret
clear
echo Do you want to save info y or n
read ynsave
if [[ $ynsave == "y" ]]
then
	saveinfo
else
	echo OK
fi
fi
# Clears screen and sets tweet as variable
clear
echo Hitting ENTER will send tweet.
echo You want to tweet-
read tweet

# Adds all tweet info into file
echo "import sys" >>tweet.py
echo "import tweepy" >>tweet.py
echo "" >>tweet.py
echo "# Create var for each key" >>tweet.py
echo "consumer_key = '$ckey'" >>tweet.py
echo "consumer_secret = '$csecret'" >>tweet.py
echo "access_token = '$atoken'" >>tweet.py
echo "access_token_secret = '$asecret'" >>tweet.py
echo "" >>tweet.py
echo "# Setup OAuth and integrate API" >>tweet.py
echo "auth = tweepy.OAuthHandler(consumer_key, consumer_secret)" >>tweet.py
echo "auth.set_access_token(access_token, access_token_secret)" >>tweet.py
echo "api = tweepy.API(auth)" >>tweet.py
echo "" >>tweet.py
echo "# The tweet" >>tweet.py
echo "tweet = '$tweet'" >>tweet.py
echo "api.update_status(status=tweet)" >>tweet.py

# Runs file
sudo python tweet.py

# Deletes current tweet python file
sudo rm tweet.py

# Displays DONE and exits
clear
echo DONE
sleep 5
clear
exit 0
