module FileUploadRails
  class Engine < ::Rails::Engine
    isolate_namespace FileUploadRails

    # Configura os geradores do Rails
    # Agora eles vão utilizar o rspec como ferramenta de integração
    # E framework de testes
    config.generators do |g|
      g.test_framework :rspec
      g.integration_tool :rspec
    end
  end
end

