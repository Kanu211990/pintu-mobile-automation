class RegisterRequirement
  include DataMagic
  DataMagic.load 'register.yml'

  def load_data(data)
    data_for "register/#{data}"
  end
end
