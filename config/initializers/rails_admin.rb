RailsAdmin.config do |config|
  config.authorize_with do
    redirect_to main_app.root_path unless current_user.admin?
  end
end

RailsAdmin.config do |config|

  ### Popular gems integration

  ## == Devise ==
  # config.authenticate_with do
  #   warden.authenticate! scope: :user
  # end
  # config.current_user_method(&:current_user)

  ## == Cancan ==
  # config.authorize_with :cancan

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration
  
  ######################################################################################################
  # If your default_local is different from :en, uncomment the following 2 lines and set your default locale here:
  # require 'i18n'
  # I18n.default_locale = :de
  config.current_user_method { current_user } # auto-generated
  # If you want to track changes on your models:
  # config.audit_with :history, User
  # Or with a PaperTrail: (you need to install it first)
  # config.audit_with :paper_trail, User
  # Set the admin name here (optional second array element will appear in a beautiful RailsAdmin red ©)
  config.main_app_name = ['EnglishPro', '管理']
  # or for a dynamic name:
  # config.main_app_name = Proc.new { |controller| [Rails.application.engine_name.titleize, controller.params['action'].titleize] }
  #  ==> Global show view settings
  # Display empty fields in show views
  # config.compact_show_view = false
  #  ==> Global list view settings
  # Number of default rows per-page:
  # config.default_items_per_page = 20
  #  ==> Included models
  # Add all excluded models here:
  # config.excluded_models = [Answer, Test, Friend,Result]
  # Add models here if you want to go 'whitelist mode':
  # config.included_models = [Category, Customer, Item]
  # Application wide tried label methods for models' instances
  # config.label_methods << :description # Default is [:name, :title]
  #  ==> Global models configuration
  # config.models do
  #   # Configuration here will affect all included models in all scopes, handle with care!
  #
  #   list do
  #     # Configuration here will affect all included models in list sections (same for show, export, edit, update, create)
  #
  #     fields_of_type :date do
  #       # Configuration here will affect all date fields, in the list section, for all included models. See README for a comprehensive type list.
  #     end
  #   end
  # end
  #
  #  ==> Model specific configuration
  # Keep in mind that *all* configuration blocks are optional.
  # RailsAdmin will try his best to provide the best defaults for each section, for each field.
  # Try to override as few things as possible, in the most generic way. Try to avoid setting labels for models and attributes, use ActiveRecord I18n API instead.
  # Less code is better code!
  # config.model MyModel do
  #   # Cross-section field configuration
  #   object_label_method :name     # Name of the method called for pretty printing an *instance* of ModelName
  #   label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
  #   label_plural 'My models'      # Same, plural
  #   weight -1                     # Navigation priority. Bigger is higher.
  #   parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
  #   navigation_label              # Sets dropdown entry's name in navigation. Only for parents!
  #   # Section specific configuration:
  #   list do
  #     filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
  #     items_per_page 100    # Override default_items_per_page
  #     sort_by :id           # Sort column (default is primary key)
  #     sort_reverse true     # Sort direction (default is true for primary key, last created first)
  #     # Here goes the fields configuration for the list view
  #   end
  # end
  # Your model's configuration, to help you get started:
  # All fields marked as 'hidden' won't be shown anywhere in the rails_admin unless you mark them as visible. (visible(true))
  # config.model Category do
  #   # Found associations:
  #   # Found columns:
  #     configure :id, :integer
  #     configure :name, :string
  #     configure :created_at, :datetime
  #     configure :updated_at, :datetime   #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  # end
  # config.model Customer do
  #   # Found associations:
  #     configure :items, :has_many_association   #   # Found columns:
  #     configure :id, :integer
  #     configure :name, :string
  #     configure :email, :string
  #     configure :created_at, :datetime
  #     configure :updated_at, :datetime   #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  # end
  # config.model Item do
  #   # Found associations:
  #     configure :customer, :belongs_to_association
  #     configure :category, :belongs_to_association   #   # Found columns:
  #     configure :id, :integer
  #     configure :name, :string
  #     configure :description, :text
  #     configure :customer_id, :integer         # Hidden
  #     configure :category_id, :integer         # Hidden
  #     configure :created_at, :datetime
  #     configure :updated_at, :datetime   #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  # end
  
  config.model User do

     list do
       items_per_page 100
       field :id
       field :name
       field :email
       field :age
       field :gender
       field :admin
     end
     
     edit do
       group :basic_info do
         label "Basic Infomation"
         field :email
         field :password
         field :password_confirmation
         field :name
         field :age
         field :gender
         field :admin
       end
     end
   end
   
   
   config.model Word do
     configure :answers, :has_many_association
     
     list do
       items_per_page 100
       field :id
       field :content
       field :lesson
     end
   end
   
   config.model Answer do
     edit do
       field :content
       field :correct
     end
   end
  ################################################################################################################
  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end
end
