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
      show_spinner("Registring extra Users...", "Users Registred!") { %x(rails dev:add_extra_users) }
      show_spinner("Cadastrando assuntos padrão...") { %x(rails dev:add_subjects) }
      show_spinner("Cadastrando perguntas e respostas...") { %x(rails dev:add_answers_and_questions) }
      show_spinner("Cadastrando Provas...") { %x(rails dev:create_test) }
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

  desc "Adiciona users extras"
  task add_extra_users: :environment do
    10.times do |i|
      User.create!(
        email: Faker::Internet.email,
        password: DEFAULT_PASSWORD,
        password_confirmation: DEFAULT_PASSWORD
      )
    end
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
      rand(1..20).times do |i|
        params = create_params(subject, i)
        answers_array = params[:question][:answers_attributes]

        rand(2..5).times do |j|
          answers_array.push(
            {
              description: "#{Faker::Lorem.sentence}#",
              correct: false
            }
          )
        end

        index = rand(answers_array.size)
        
        answers_array[index] = {
          description: "#{Faker::Lorem.sentence}#",
          correct: true
        }
        
        Question.create!(params[:question])
      end
    end
  end

  desc "Reseta o contador dos assuntos"
  task reset_subjects_counter: :environment do
    show_spinner("Resetando contador dos assuntos...") do
      Subject.all.each do |subject|
        Subject.reset_counters(subject.id, :questions)
      end
    end
  end  

  desc "Adiciona prova"
  task create_test: :environment do
    rand(2..4).times do |i|
      subject = Subject.all.sample
      Test.create!([
        { 
          description: "Test #{i}", 
          subject: subject, 
          question_ids: [
                          Question.all[0].id, 
                          Question.all[1].id,
                          Question.all[33].id, 
                          Question.all[53].id, 
                          Question.all[12].id, 
                          Question.all[87].id, 
                          Question.all[34].id, 
                          Question.all[66].id, 
                          Question.all[77].id, 
                          Question.all[40].id, 
                        ] 
        }
      ])
    end
  end  

  # desc "Add default Tests"
  # task add_default_tests: :environment do
  #   show_spinner("Creating default Tests...") do
  #     2.times do |t|
  #     Test.all.each do |tests|
  #       Subject.reset_counters(subject.id, :questions)
  #     end
  #   end
  # end  

  private

  def elect_true_answer(answers_array = [])
    selected_index = rand(answers_array.size)
    answers_array[selected_index] = create_answer_params(true)
  end
  def add_answers(answers_array = [])
    rand(2..5).times do |j|
      answers_array.push(
        create_answer_params
      )
    end
  end

  def create_answer_params(correct = false)
    { description: Faker::Lorem.sentence, correct: correct }
  end
  def create_question_params(subject = Subject.all.sample)
    { question: {description: "#{Faker::Lorem.paragraph} #{Faker::Lorem.question}",
         subject: subject,
         answers_attributes: [],
         weight: 1
      }
    }
  end

  def show_spinner(start_msg, end_msg = "Successfull")
    spinner = TTY::Spinner.new("[:spinner] #{start_msg}")
    spinner.auto_spin # Automatic animation with default interval
    yield
    spinner.success("(#{end_msg})")
  end

  def create_params(subject = Subject.all.sample, i)
    { 
      question: 
                {
                  description: "#{Faker::Lorem.paragraph}#{Faker::Lorem.question}",
                  subject: subject,
                  weight: i + 1,
                  answers_attributes: [] 
                }
    }
  end

end
