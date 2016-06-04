class Reinboo < KristClient

  private
  def generatePrivateKey(privatekey: "")
    Digest::SHA256.hexdigest("REINBOO"+privatekey)+"-000"
  end

end
