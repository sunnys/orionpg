class ThirdPartyEmployee < User
  belongs_to :third_party_vendor
  belongs_to :user
end
