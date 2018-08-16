class Member < ApplicationRecord
  def to_launch_darkly
    {
      key:      external_id,
      name:     name,
      surname:  surname
    }
  end
end
