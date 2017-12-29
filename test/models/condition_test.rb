require 'test_helper'

class ConditionTest < ActiveSupport::TestCase
  test "regex, include" do
    condition = build_condition("address1", "regex", "^(potato|banana)$")
    assert condition.valid_for?("potato")
    refute condition.valid_for?("zpotato")
    refute condition.valid_for?("potatoz")
    assert condition.valid_for?("banana")
    refute condition.valid_for?("zbanana")
    refute condition.valid_for?("bananaz")
  end

  test "equal" do
    condition = build_condition("address1", "equal", "potato|banana")
    assert condition.valid_for?("potato")
    refute condition.valid_for?("zpotato")
    refute condition.valid_for?("potatoz")
    assert condition.valid_for?("banana")
    refute condition.valid_for?("zbanana")
    refute condition.valid_for?("bananaz")
  end

  test "start_with" do
    condition = build_condition("address1", "start_with", "potato")
    assert condition.valid_for?("potato")
    assert condition.valid_for?("potatoz")
    refute condition.valid_for?("zpotato")

    condition = build_condition("zip", "start_with", "902|111|555")
    assert condition.valid_for?("90200")
    refute condition.valid_for?("09020")
    refute condition.valid_for?("00902")
    refute condition.valid_for?("00000")
    assert condition.valid_for?("55590")
    refute condition.valid_for?("95550")
  end

  test "end_with" do
    condition = build_condition("address1", "end_with", "potato")
    assert condition.valid_for?("potato")
    assert condition.valid_for?("zpotato")
    refute condition.valid_for?("potatoz")
  end

  test "exclude" do
    condition = build_condition("address1", "exclude", "potato")
    refute condition.valid_for?("potato")
    refute condition.valid_for?("zpotatoz")
    assert condition.valid_for?("banana")
  end

  private

  def build_condition(field, verb, value)
    Condition.new(field: field, verb: verb, value: value)
  end
end
