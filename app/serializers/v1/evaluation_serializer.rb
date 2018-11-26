module V1
  class EvaluationSerializer
    include FastJsonapi::ObjectSerializer

    attributes :state, :completed_at, :template_name, :updated_at

    attribute :employee do |evaluation|
      evaluation.employee.attributes.slice(
        'id',
        'first_name',
        'last_name',
        'position',
        'hired_at',
        'next_evaluation_at',
        'state',
        'released_at'
      )
    end

    attribute :sections_attributes do |evaluation|
      evaluation.sections.map do |section|
        section.attributes.slice(
          'id',
          'name',
          'group',
          'width',
          'position',
          'skills'
        )
      end
    end

  end
end