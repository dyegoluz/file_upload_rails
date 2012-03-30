module FileUploadRails
  module TemplateHelper

    # Renderiza os templates a partir de uma parcial rails
    # Ou passando um bloco diretamente
    def file_upload_template(id, partial=nil, &block)

      # Verifica se um bloco foi passado como parametro do metodo
      # Se for usa o bloco
      # Se não for usa a parcial localizada no endereço passado no parametro
      if block_given?
        code = capture(&block)
      else
        code = capture do
          render partial
        end
      end

      # Gera um script tag com o id passado no metodo
      # E com o codigo da parcial ou do bloco renderizado
      content_tag :script,id: id, type: "text/x-jquery-template" do
        code
      end
    end
  end
end

