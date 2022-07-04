module ApplicationHelper
    def aplication_name
        I18n.locale == :en ? "CRYPTO WALLET APP" : "APLICAÇÃO CARTEIRA DE CRYPTOMOEDAS"
    end

    def title_name
        I18n.locale == :en ? "Editing coin" : "Editando moeda"
    end

    def rails_env
        if Rails.env.development?
            'Desenvolvimento'
        elsif Rails.env.production?
            'Produção'
        else
            'Teste'
        end
    end

    def locale
        I18n.locale == :en ? "US" : "BR"
    end
end
