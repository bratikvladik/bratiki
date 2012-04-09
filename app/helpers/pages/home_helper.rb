#coding: UTF-8
module Pages::HomeHelper
  def format_date(date)
    str = date.strftime("%B %Y")
    array = str.split(' ')
    month = array[0]
    year = array[1]
    month = case month
              when "January" then
                "Январь"
              when "February" then
                "Февраль"
              when "March" then
                "Март"
              when "April" then
                "Апрель"
              when "May" then
                "Май"
              when "June" then
                "Июнь"
              when "July" then
                "Июль"
              when "August" then
                "Август"
              when "September" then
                "Сенятбрь"
              when "October" then
                "Октябрь"
              when "November" then
                "Ноябрь"
              when "December" then
                "Декабрь"

            end
    date = month + " " + year
  end

  def slot(schedule, day)
    str = "<table>"
    str += "<tr><td>" + day.to_s + "</td></tr>"
    4.times do |i|
      str += "<tr><td>"
      for para in schedule
        if para.number == i
          str += para.object
        end
      end
      str += "</td></tr>"
    end
    str += "</table>"
  end
end
