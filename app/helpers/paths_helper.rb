module PathsHelper

  def get_human_week_day(datetime)
    week_day_name = case datetime.wday
      when 1 then 'lunes'
      when 2 then 'martes'
      when 3 then 'miércoles'
      when 4 then 'jueves'
      when 5 then 'viernes'
      when 6 then 'sábado'
      when 7 then 'domingo'
    end
  end

  def get_human_month(datetime)
    month_name = case datetime.month
      when 1 then 'enero'
      when 2 then 'febrero'
      when 3 then 'marzo'
      when 4 then 'abril'
      when 5 then 'mayo'
      when 6 then 'junio'
      when 7 then 'julio'
      when 8 then 'agosto'
      when 9 then 'septiembre'
      when 10 then 'octubre'
      when 11 then 'noviembre'
      when 12 then 'diciembre'
    end
  end
end
