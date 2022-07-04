namespace :dev do

  DEFAULT_PASSWORD = 123456
  DEFAULT_FILES_PATH = File.join(Rails.root, 'lib', 'tmp')

  desc "Configure the development environment"
  task setup: :environment do
    if Rails.env.development?
      show_spinner("Deleting database...", "Database deleted!") { %x(rails db:drop) }
      show_spinner("Creating database...", "Database created!") { %x(rails db:create) }
      show_spinner("Migrating database...", "Database migrated!") { %x(rails db:migrate) }
      show_spinner("Registring Admin...", "Admin Registred!") { %x(rails dev:add_default_admin) }
      show_spinner("Registring extra Admins...", "Admins Registred!") { %x(rails dev:add_extra_admins) }
      show_spinner("Registring User...", "User Registred!") { %x(rails dev:add_default_user) }
      show_spinner("Cadastrando assuntos padrão...") { %x(rails dev:add_subjects) }
      show_spinner("Cadastrando perguntas e respostas...") { %x(rails dev:add_answers_and_questions) }
    else
      puts "Environment must be DEVELOPMENT"
    end
  end

  desc "Adiciona o administrador padrão"
  task add_default_admin: :environment do
    Admin.create!(
      email: 'admin@admin.com',
      password: DEFAULT_PASSWORD,
      password_confirmation: DEFAULT_PASSWORD
    )
  end

  desc "Adiciona adms extras"
  task add_extra_admins: :environment do
    10.times do |i|
      Admin.create!(
        email: Faker::Internet.email,
        password: DEFAULT_PASSWORD,
        password_confirmation: DEFAULT_PASSWORD
      )
    end
  end

  desc "Adiciona o Usuário padrão"
  task add_default_user: :environment do
    User.create!(
      email: 'user@user.com',
      password: DEFAULT_PASSWORD,
      password_confirmation: DEFAULT_PASSWORD
    )
  end

  desc "Adiciona assuntos padrão"
  task add_subjects: :environment do
    file_name = 'subjects.txt'
    file_path = File.join(DEFAULT_FILES_PATH, file_name)

    File.open(file_path, 'r').each do |line|
      Subject.create!(description: line.strip)
    end
  end  

  desc "Adiciona perguntas e respostas"
  task add_answers_and_questions: :environment do
    Subject.all.each do |subject|
      rand(5..10).times do |i|
        Question.create!(
          description: "#{Faker::Lorem.paragraph} #{Faker::Lorem.question}",
          subject: subject
        )
      end
    end
  end  

  private

  def show_spinner(start_msg, end_msg = "Successfull")
    spinner = TTY::Spinner.new("[:spinner] #{start_msg}")
    spinner.auto_spin # Automatic animation with default interval
    yield
    spinner.success("(#{end_msg})")
  end

end
