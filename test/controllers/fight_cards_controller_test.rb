require 'test_helper'

class FightCardsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @fight_card = fight_cards(:one)
  end

  test "should get index" do
    get fight_cards_url
    assert_response :success
  end

  test "should get new" do
    get new_fight_card_url
    assert_response :success
  end

  test "should create fight_card" do
    assert_difference('FightCard.count') do
      post fight_cards_url, params: { fight_card: { fight_arena: @fight_card.fight_arena, fight_date: @fight_card.fight_date, fight_end_time: @fight_card.fight_end_time, fight_id: @fight_card.fight_id, fight_image: @fight_card.fight_image, fight_start_time: @fight_card.fight_start_time, fight_tagline: @fight_card.fight_tagline, fight_title: @fight_card.fight_title, ticket_url: @fight_card.ticket_url } }
    end

    assert_redirected_to fight_card_url(FightCard.last)
  end

  test "should show fight_card" do
    get fight_card_url(@fight_card)
    assert_response :success
  end

  test "should get edit" do
    get edit_fight_card_url(@fight_card)
    assert_response :success
  end

  test "should update fight_card" do
    patch fight_card_url(@fight_card), params: { fight_card: { fight_arena: @fight_card.fight_arena, fight_date: @fight_card.fight_date, fight_end_time: @fight_card.fight_end_time, fight_id: @fight_card.fight_id, fight_image: @fight_card.fight_image, fight_start_time: @fight_card.fight_start_time, fight_tagline: @fight_card.fight_tagline, fight_title: @fight_card.fight_title, ticket_url: @fight_card.ticket_url } }
    assert_redirected_to fight_card_url(@fight_card)
  end

  test "should destroy fight_card" do
    assert_difference('FightCard.count', -1) do
      delete fight_card_url(@fight_card)
    end

    assert_redirected_to fight_cards_url
  end
end
