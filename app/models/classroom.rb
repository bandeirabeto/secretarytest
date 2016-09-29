class Classroom < ActiveRecord::Base
  belongs_to :student
  belongs_to :course

  validates_uniqueness_of :student_id, scope: [:course_id, :student_id]

  validates :course_id,
            presence: true

  validates :student_id,
            presence: true

  before_create :set_entry_at

  private

    # Internal : Busca todas as matriculas ordenando-as pelo id do curso
    #
    def self.search_all
      all.order(course_id: :asc)
    end

    # Internal : Atribui data e hora à matricula do estudante antes de fazer a
    #             persistência.
    #
    # self - Objeto Classroom que está sendo encaminhado para persistência.
    def set_entry_at
      self.entry_at = Time.now
    end
end
