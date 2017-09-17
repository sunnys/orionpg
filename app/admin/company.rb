ActiveAdmin.register Company do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :name, :address, account_attributes: [:id, :name, :total, :unpaid, :paid, :_destroy]
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_admin_user
#   permitted
# end
form do |f|
    f.inputs 'Details' do
      f.input :name
      f.input :address
    end
    # f.inputs do
    #   f.has_many :employees, heading: 'Employees', allow_destroy: true, new_record: false do |a|
    #     a.input :title
    #     a.input :email
    #   end
    # end
    f.inputs do
      f.has_many :account do |t|
        t.input :name
        t.input :total
        t.input :unpaid
        t.input :paid
      end
    end
    f.actions
end

end
