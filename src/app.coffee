OAuth = require("oauth").OAuth
async = require("async")
config = JSON.parse(require("fs").readFileSync(
							__dirname + "/../config.json"))
key = config.key

twitter_oauth = new OAuth(
	"https://api.twitter.com/oauth/request_token",
	"https://api.twitter.com/oauth/access_token",
	key.consumer_key,
	key.consumer_secret,
	"1.0",
	null,
	"HMAC-SHA1"
	)

e_kisei = 0
e_other = 0
success = 0

async.series [
	(callback) ->
		for i in [127..1] by -1
			tweet = "バルス"
			star = ""
			for j in [i..1] by -1
				star += "☆"
			tweet = tweet + star
			twitter_oauth.post(
				"http://api.twitter.com/1.1/statuses/update.json",
				key.access_token,
				key.access_token_secret,
				{"status": tweet},
				"application/json",
				(error, data, response) ->
					if error
						data = JSON.parse(error.data)
						if data.errors[0].code is 185
							e_kisei++
						else
							console.log data
							e_other++
					else
						success++
					callback()
				)
], (err, result)->
	console.log ""
	console.log "success: " + success
	console.log "faild: limit:" + e_kisei
	console.log "faild: other: " + e_other

console.log "alldone!"



