module FileUploadRails
  module Callbacks
    module AddCallbackHelper

      # Todos os metodos aqui são privados
      # Eles são usados por outros metodos helpers de outros modulos
      private

      # Quando uma imagem é adicionada a fila de arquivos
      # Esse callback é executado
      def add_callback(id, options)

        # Adiciona a função callback ao uploader
        # Passa no bloco parametros exclusivos do callback add
        callback_function(id, options, "add") do
          "\tdata.submit();\n"
        end
      end
    end
  end
end

