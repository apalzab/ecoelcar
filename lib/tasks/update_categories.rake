task :update_categories => [:environment] do

  categories = ["Berlina", "Turismo", "Descapotable", "Ranchera", "4x4", "Familiar", "Monovolumen", "Utilitario"]
  categories.each do |c|
    VehicleCategory.create(name: c)
  end
end
