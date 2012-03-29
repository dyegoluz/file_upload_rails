module FileUploadRails
  module Callbacks
    module ChangeCallbackHelper

      # Todos os metodos aqui são privados
      # Eles são usados por outros metodos helpers de outros modulos
      private

      # Quando o conteudo input é alterado
      # Esse metodo callback é executado
      def change_callback(id, options)

        # Adiciona a função callback ao uploader
        # Passa no bloco parametros exclusivos do callback change
        callback_function(id, options, "change")
      end
    end
  end
end

