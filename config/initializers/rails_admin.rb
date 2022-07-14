# config/initializers/rails_admin.rb
RailsAdmin.config do |config|
  config.actions do
    # root actions
    # root :google_map :dashboard
    dashboard do
      i18n_key :messages
    end                
    # collection actions 
    index                         # mandatory
    new
    export
    history_index
    bulk_delete
    # member actions
    show
    edit
    delete
    history_show
    show_in_app
  end
end