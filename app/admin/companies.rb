ActiveAdmin.register Company do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end
permit_params :name

  index do
    column :id
    column :name
    column :created_at
    column :complains do |company|
            company.complains.count
        end
        actions
  end

  filter :name
  filter :created_at, as: :date_range

form do |f|
    inputs 'Agregar un nueva empresa' do
    input :name
    end
    actions
end
end