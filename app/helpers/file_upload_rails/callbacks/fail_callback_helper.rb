module FileUploadRails
  module Callbacks
    module FailCallbackHelper

      # Todos os metodos aqui são privados
      # Eles são usados por outros metodos helpers de outros modulos
      private

      # Quando o conteudo input é alterado
      # Esse metodo callback é executado
      def fail_callback(id, options)

        # Adiciona a função callback ao uploader
        # Passa no bloco parametros exclusivos do callback fail
        callback_function(id, options, "fail")
      end
    end
  end
end

