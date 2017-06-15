defmodule JobAgg.ExAdmin.Job do
  use ExAdmin.Register

  register_resource JobAgg.Job do
    index do
      selectable_column()

      column :id
      column :title
      column :company
      column :date_added
      actions()     # display the default actions column
    end
  end
end
