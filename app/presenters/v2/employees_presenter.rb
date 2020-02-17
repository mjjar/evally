# frozen_string_literal: true

module V2
  class EmployeesPresenter
    def employees
      V2::EmployeesQuery.new.call
    end

    def evaluators
      User.all
    end
  end
end
