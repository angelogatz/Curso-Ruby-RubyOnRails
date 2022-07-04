namespace :dev do
  desc "Configure the development environment"
  task setup: :environment do
    if Rails.env.development?
      show_spinner("Deleting database...", "Database deleted!") { %x(rails db:drop) }
      show_spinner("Creating database...", "Database created!") { %x(rails db:create) }
      show_spinner("Migrating database...", "Database migrated!") { %x(rails db:migrate) }
      %x(rails dev:add_mining_types)
      %x(rails dev:add_coins) 
    else
      puts "Environment must be DEVELOPMENT"
    end
  end

  desc "Coins registration"
  task add_coins: :environment do
    show_spinner("Registring coins...", "Coins registred") do
      coins = [
        {
          description: "Bitcoin",
          acronym: "BTC",
          url_image: "https://imagensemoldes.com.br/wp-content/uploads/2020/09/Bitcoin-PNG.png",
          mining_type: MiningType.find_by(acronym: 'PoW')
        },
        {
          description: "Ethereum",
          acronym: "ETH",
          url_image: "https://upload.wikimedia.org/wikipedia/commons/b/b7/ETHEREUM-YOUTUBE-PROFILE-PIC.png",
          mining_type: MiningType.all.sample
        },
        {
          description: "Dash",
          acronym: "DASH",
          url_image: "https://www.pngall.com/wp-content/uploads/10/Dash-Crypto-Logo-PNG-Cutout.png",
          mining_type: MiningType.all.sample
        },
        {
          description: "Cardano",
          acronym: "ADA",
          url_image: "https://cdn4.iconfinder.com/data/icons/crypto-currency-and-coin-2/256/cardano_ada-512.png",
          mining_type: MiningType.all.sample
        },
        {
          description: "Tether",
          acronym: "USDT",
          url_image: "https://w7.pngwing.com/pngs/917/678/png-transparent-tether-tether-coin-cryptocurrency-logo-bitcoin-crypto-currency-cryptocurrency-sign-3d-icon-thumbnail.png",
          mining_type: MiningType.all.sample
        }
      ]

      coins.each do |coin|
        Coin.find_or_create_by!(coin)
      end
    end
  end

  desc "Mining types registration"
  task add_mining_types: :environment do
    show_spinner("Registring mining types...", "Mining Types registred") do
      mining_types = [
        {
          description: "Proof of Work",
          acronym: "PoW"
        },
        {
          description: "Proof of Stake",
          acronym: "PoS"
        },
        {
          description: "Proof of Capacity",
          acronym: "PoC"
        }
      ]

      mining_types.each do |mining_type|
        MiningType.find_or_create_by!(mining_type)
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
