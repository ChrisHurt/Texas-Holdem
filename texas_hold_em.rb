require 'pry'
deck = {}
players = {}
$global_deck_index = 1

def populate_deck deck
    13.times do |index|
        char = nil
        case (index + 1)
        when 1
            char = 'A'
        when 2..10
            char = (index + 1).to_s
        when 11
            char = 'J'
        when 12
            char = 'Q'
        when 13
            char = 'K'
        end
        deck[char + '♣'] = {
            'order' => 0,
            :dealt => false
        }
        deck[char + '◆'] = {
            'order' => 0,
            :dealt => false
        }
        deck[char + '♥'] = {
            'order' => 0,
            :dealt => false
        }
        deck[char + '♠'] = {
            'order' => 0,
            :dealt => false
        }
    end
end

def shuffle_deck deck
    deck.each do |index, card|
        random_num = rand(52)+1
        while (deck.find { |index,card| card['order'] == random_num }) do
            random_num = rand(52)+1
        end
        card['order'] = random_num
    end
end

def deal_cards num_players, deck, players
    num_players.times do |index|
        players['player' + (index + 1).to_s] = []
    end

    2.times do |index|
        num_players.times do |index|
            random_card =  deck.find { |index,card| card['order'] == $global_deck_index }
            players['player' + (index + 1).to_s] << random_card[0]
            random_card[1][:dealt] = true
            $global_deck_index += 1
        end
    end
end

populate_deck(deck)
shuffle_deck(deck)


binding.pry


puts "how many players?"

players = gets.chomp

