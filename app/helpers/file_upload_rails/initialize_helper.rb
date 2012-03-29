module FileUploadRails
  module InitializeHelper

    # Inicializa o código javascript que vai receber os uploaders
    def file_upload_initialize
      javascript_tag do
        "$(document).ready(function(){\n" +
          content_for(:file_upload) +
        "});\n"
      end
    end

    private

    # Cria o uploader usando o metodo padrão da biblioteca javascript
    # Insere ele dentro do bloco javascript criado na execução do metodo de inicialização
    def uploader_create(id)
      content_for :file_upload do
        "$('#{id}').fileupload();\n"
      end
    end

  end
end

