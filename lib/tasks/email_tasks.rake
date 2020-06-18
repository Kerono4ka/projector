desc 'daily letters'
task sand_daily_letters: :environment do
  @users = User.joins(:cards).where(receive_emails: true,
                                      cards: { start_date: Date.today }).uniq
    @cards = []
    @users.each_with_index do |user, index|
      @cards[index] = user.cards.where(start_date: Date.today).find_each
    end

    @users.each_with_index do |user,index|
      TaskMailer.daily_letters(user, @cards[index]).deliver!
    end
end