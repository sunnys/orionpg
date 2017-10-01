class AddOtpSecretKeyToTokens < ActiveRecord::Migration[5.0]
  def change
    add_column :tokens, :otp_secret_key, :string
  end
end
