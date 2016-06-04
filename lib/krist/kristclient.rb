class KristClient

	@@baseurl = "http://krist.ceriat.net/"

	def initialize(privatekey)
		@privatekey = generatePrivateKey(privatekey: privatekey)
		@address = post("v2",{privatekey: @privatekey})["address"]
	end

	def getAddress
		@address
	end

	def sendTo(to:, amount:)
		transactions = post("transactions", {privatekey: @privatekey, to: to, amount: amount, metadata: "Hello from the other side!"})
		transactions["transactions"].delete_if {|key, value| !(value["from"] == @address) || !(value["to"] == address) }
		transactions
	end

	def recentTransactions(limit: 50, offset: 0)
		get("addresses/#{@address}/transactions?limit=#{limit}&offset=#{offset}")
	end

	def getDomains
		get("addresses/#{@address}/names")
	end

	def registerWebhook(event: "transaction", url:, method: "post")
		post("webhooks", {
			privatekey: @privatekey,
			owner: @address,
			event: event,
			url: url,
			method: method
			})
	end

	def getWebhooks
		post("webhooks/#{@address}", {privatekey: @privatekey})
	end

	def deleteWebhook(id:)
		post("webhooks/#{id}/delete", {privatekey: @privatekey, owner: @address})
	end

	def registerDomain(name:)
		post("names/#{name}", {privatekey: @privatekey})
	end

	def updateDomainRecord(name: a:)
		post("names#{name}/update", {a: a, privatekey: @privatekey})
	end

	def transferDomain(name:, to:)
		post("names/#{name}/transfer", {address: to, privatekey: @privatekey})
	end

	private
	def get(path)
		response = HTTParty.get(@@baseurl+path)
		JSON.load(response.body)
	end

	private
	def post(path, data)
		response = HTTParty.post(@@baseurl+path, body: data)
		JSON.load(response.body)
	end

	def generatePrivateKey(privatekey:)
		privatekey
	end

end
