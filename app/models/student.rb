class Student < ActiveRecord::Base
  has_many :classrooms
  has_many :courses, class_name: 'Course', dependent: :destroy, through: :classrooms

  validates :name,
            presence: true,
            length: { maximum: 44, minimum: 3 }

  validates :register_number,
            presence: true,
            length: { maximum: 44, minimum: 14 }

  validates :status,
            presence: true

  private

    # Internal - Busca todos os estudantes ordenando-os por nome.
    #
    def self.search_all
      all.order(name: :asc)
    end

    # Internal - Busca apenas estudantes ativos.
    #
    def self.active
      where(status: Status::ACTIVE)
    end
end
