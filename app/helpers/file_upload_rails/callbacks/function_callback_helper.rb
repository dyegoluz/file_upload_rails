module FileUploadRails
  module Callbacks
    module FunctionCallbackHelper

      # Lista de callbacks permitidos
      @@callbacks = ["change","add","done","fail"]

      # Todos os metodos aqui são privados
      # Eles são usados por outros metodos helpers de outros modulos
      private

      # Percorre todos os metodos callbacks
      # E adiciona eles um por um usando o metodo .bind() no elemento input
      def generate_callbacks(id, callbacks)
        callbacks.each do |key, value|
          send("#{key}_callback", id, value) if @@callbacks.include?(key.to_s)
        end
      end

      # Cria função javascript para adição do callback ao uploader
      def callback_function(id, options, callback_name, &block)

        # Garante que os parametros são simbolos
        options.to_options

        # Retorna um elemento jquery
        # Esse elemento pode ser um já existente ou um criado e enviado como context na requisição ajax
        element = generate_jquery_element(options[:append_to] || options[:prepend_to] || options[:exchange])

        # Se um bloco for passado como parametro da função
        # Captura esse bloco para exibi-lo no callback
        # Se não retorna apenas uma string vazia
        if block_given?
          block_code = capture(&block)
        else
          block_code = ""
        end

        # Captura o código javascript que será retornado.
        # Código usar o bind para adicionar o callback ao uploader
        # Cria um template usando template jquery
        # Aplica o template ao elemento html ou ao context
        callback = capture do
          "$('#{id}').bind('fileupload#{callback_name}', function(e,data){\n" +
            "\tvar template = $.tmpl('#{options.delete(:template)}', data);\n" +
            "\tvar element = #{element}" +
            apply_template(options) +
            block_code +
          "});\n"
        end

        # Adiciona a função javascript no script tag gerado na inicialização
        content_for :file_upload do
          callback
        end
      end

      # Aplica o template ao elemento ou ao context
      # Isso depende das options enviadas na criação do input conter :context => true
      def apply_template(options)

        # Seleciona a ação correta para aplicar o template ao elemento
        applied_template = "element.append(template);" if options[:append_to]
        applied_template = "element.prepend(template);" if options[:prepend_to]
        applied_template = "element.html(template);" if options[:exchange]

        # Se context for definido com true
        # Adiciona ao context que será enviado na requisição o elemento com o template aplicado
        if options[:context]
          "\tdata.context = #{applied_template}\n"

        # Se não apenas aplica o template ao elemento
        else
          "\t" + applied_template + "\n"
        end
      end

      # Retorna o elemento jquery ou o context para que o template seja aplicado a ele
      def generate_jquery_element(value)
        if value == :context
          "data.context;\n"
        else
          "$('#{value}');\n"
        end
      end

    end
  end
end

