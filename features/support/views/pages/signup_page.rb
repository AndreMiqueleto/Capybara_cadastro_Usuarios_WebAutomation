class SignupPage
  include Capybara::DSL

  def open
    visit "http://prova.stefanini-jgr.com.br/teste/qa/"
  end

  def create(user)
    find("#name").set user[:nome]
    find("#email").set user[:email]
    find("#password").set user[:senha]

    click_button "Cadastrar"
  end
end
