class KWallet < KristClient

  private
  def generatePrivateKey(privatekey: "")
    Digest::SHA256.hexdigest("KRISTWALLET"+privatekey)+"-000"
  end

end
