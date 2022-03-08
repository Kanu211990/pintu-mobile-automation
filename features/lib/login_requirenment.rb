class LoginRequirement
  include DataMagic
  DataMagic.load 'login.yml'

  def load_data(data)
    data_for "login/#{data}"
  end
end
