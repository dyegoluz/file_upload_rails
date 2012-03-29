module FileUploadRails
  module ApplicationHelper

    # Inclui todos os outros helpers basicos
    include FileUploadRails::InitializeHelper
    include FileUploadRails::InputHelper

    # Inclui todos os helpers que inicializam os callbacks
    include FileUploadRails::Callbacks::FunctionCallbackHelper
    include FileUploadRails::Callbacks::AddCallbackHelper
    include FileUploadRails::Callbacks::ChangeCallbackHelper
    include FileUploadRails::Callbacks::DoneCallbackHelper
    include FileUploadRails::Callbacks::FailCallbackHelper


    private

    # Converte #id ou .id ou i d em id
    def sanitize_id(id)

      #Adicionar mais conversões
      id.gsub("#", "")
    end
  end
end

