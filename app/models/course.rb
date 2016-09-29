class Course < ActiveRecord::Base
  has_many :classrooms
  has_many :students, class_name: 'Student', dependent: :destroy, through: :classrooms

  validates :name,
            presence: true,
            length: { maximum: 44, minimum: 3 }

  validates :description,
            presence: true,
            length: { maximum: 44, minimum: 3 }

  validates :status,
            presence: true

  private

    # Internal - Busca todos os cursos ordenando-os por nome.
    #
    def self.search_all
      all.order(name: :asc)
    end

    # Internal - Busca apenas cursos ativos.
    #
    def self.active
      where(status: Status::ACTIVE)
    end
end
