ActiveRecord::Base.extend EnumerateIt

class Status < EnumerateIt::Base
  associate_values(
    active:   [1, 'Ativo'],
    inative:  [2, 'Inativo']
  )
end
