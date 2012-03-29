module FileUploadRails
  module Callbacks
    module DoneCallbackHelper

      # Todos os metodos aqui são privados
      # Eles são usados por outros metodos helpers de outros modulos
      private

      # Quando o conteudo input é alterado
      # Esse metodo callback é executado
      def done_callback(id, options)

        # Adiciona a função callback ao uploader
        # Passa no bloco parametros exclusivos do callback done
        callback_function(id, options, "done")
      end
    end
  end
end

