class WelcomeController < ApplicationController
  def index
    cookies[:curso] = "Curso de RubyOnRails - Angelo [COOKIE]"
    session[:curso] = "Curso de RubyOnRails - Angelo [SESSION]"
    @meu_nome = params[:nome]
    @curso = params[:curso]
  end
end
