RailsAdmin.config do |config|
      config.model 'Bug' do
        include_all_fields
        field :description do
          pretty_value do # used in form views
            ActionController::Base.helpers.sanitize value
          end
        end
      end

      config.model 'Bug' do
        include_all_fields
        edit do
          field :description, :text do
            html_attributes do
              {:class => "tinymce"} #dont use 600 as maxlength for a string field. It will break the UI
            end
          end
        end
      end

      config.model 'Request' do
        include_all_fields
        field :description do
          pretty_value do # used in form views
            ActionController::Base.helpers.sanitize value
          end
        end
      end

      config.model 'Request' do
        include_all_fields
        edit do
          field :description, :text do
            html_attributes do
              {:class => "tinymce"} #dont use 600 as maxlength for a string field. It will break the UI
            end
          end
        end
      end

end