# This file requires that you have made a twitter app for this
# Go to apps.twitter.com and sign in with your account. Create a Twitter application
# and go to Keys and Tokens. Generate a Consumer Key, Consumer Secret,
# Access Token, and Access Token Secret.
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

# Displays DONE
clear
echo DONE
