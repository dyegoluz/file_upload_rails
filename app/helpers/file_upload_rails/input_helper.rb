module FileUploadRails
  module InputHelper

    # Gera um input com data-attributes do html5
    def file_upload_input(id, options={})

      # Converte parametros em options
      options.to_options

      # Retira os atributos data do html 5 de options e adiciona na variavel data_attributes
      data_attributes = options.delete(:data)

      # Cria o uploader no javascript
      # Usa o id para capturar o elemento com jquery
      # Adiciona os callbacks definidos na criação do input
      # Cada callback é adicionando usando bind("fileupload#{callback}")
      uploader_create(id)
      generate_callbacks(id, options)

      # Converte o seletor jQuery em um id html padrão
      # Retorna o input com os atributos html
      file_field_tag( sanitize_id(id), {data: data_attributes})
    end
  end
end

