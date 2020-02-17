# frozen_string_literal: true

FactoryBot.define do
  factory :employee do
    first_name        { 'Rob' }
    last_name         { 'Reddington' }
    position          { 'Programmer' }
    hired_on          { 1.month.ago }
    position_set_on   { 1.month.ago }
    state             { 'hired' }

    evaluator { create(:user) }
  end
end
