module Cards
  class UpdatePositionService < ApplicationService
    attr_reader :card,
                :column,
                :target_cards_ids,
                :source_cards_ids

    def initialize(card, column, target_cards_ids, source_cards_ids = nil)
      @card, @column = card, column
      @target_cards_ids = eval(target_cards_ids) if source_cards_ids.is_a? String
      @source_cards_ids = eval(source_cards_ids) if source_cards_ids.is_a? String
    end

    def call
      Card.transaction do
        update_cards_position(target_cards_ids)
        update_cards_position(source_cards_ids) if source_cards_ids.present?
        return true, []
      rescue ActiveRecord::RecordInvalid => e
        return false, e.record.errors.full_messages
      end
    end

    private

    def update_cards_position(card_ids)
      card_ids.each_with_index do |card_id, index|
        card_to_update = Card.find(card_id)
        card_to_update.column = column if card_to_update == card
        card_to_update.position = index + 1
        card_to_update.save(validate: false)
      end
    end
  end
end