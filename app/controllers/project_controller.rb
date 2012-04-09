#coding: UTF-8
class ProjectController < ApplicationController
  def restart
    system "rake db:migrate VERSION=0"
    system "rake db:migrate"
    redirect_to(:root)
  end

  def load_schedule
    if Schedule.all.empty?
      path = File.join(File.dirname(__FILE__), "schedule.xls")
      book = Spreadsheet.open path
      teachers = Hash.new([])
      book.worksheets.each do |sheet|
        matrix = []
        group = sheet.name
        sheet.each do |row|
          string = []
          row.each do |element|
            string << element
          end
          matrix << string
        end
        matrix = matrix.transpose
        matrix.shift
        matrix.shift
        matrix.each do |row|
          monday = row[1..4]
          date_time = row[0]
          monday = monday.compact
          5.times {row.shift}

          monday.each_with_index do |para, index|
            if (para)
              block = para.split(/\n/)
              object = block[0]
              if (block[1])
                var = block[1].split(',')
                type = var[0]
                place = var[1]
                if block[2]
                  teach = block[2]
                  var2 = teach.split(' ')
                  init =  var2[-1]
                  var3 = init.split('.')
                  first_name = var3[0]
                  middle_name = var3[1]
                  last_name = var2[-2]
                  rank =  var2[-3]
                  full_name = last_name + " " + first_name + " " + middle_name
                  if !teachers.key?(full_name)
                    teachers[full_name] = []
                  end
                  number = index + 1
                  hash = Hash.new("")
                  hash["group"] = group
                  hash["object"] = object
                  hash["type"] = type
                  hash["place"] = place
                  hash["number"] = number.to_s
                  hash["date_time"] = date_time
                  teachers[full_name] << hash
                end
              end
            end
          end

          tuesday = row[1..4]
          date_time = row[0]
          5.times {row.shift}

          tuesday.each_with_index do |para, index|
            if (para)
              block = para.split(/\n/)
              object = block[0]
              if (block[1])
                var = block[1].split(',')
                type = var[0]
                place = var[1]
                if block[2]
                  teach = block[2]
                  var2 = teach.split(' ')
                  init =  var2[-1]
                  var3 = init.split('.')
                  first_name = var3[0]
                  middle_name = var3[1]
                  last_name = var2[-2]
                  rank =  var2[-3]
                  full_name = last_name + " " + first_name + " " + middle_name
                  if !teachers.key?(full_name)
                    teachers[full_name] = []
                  end
                  number = index + 1
                  hash = Hash.new("")
                  hash["group"] = group
                  hash["object"] = object
                  hash["type"] = type
                  hash["place"] = place
                  hash["number"] = number.to_s
                  hash["date_time"] = date_time
                  teachers[full_name] << hash
                end
              end
            end
          end

          wednesday = row[1..4]
          date_time = row[0]
          5.times {row.shift}

          wednesday.each_with_index do |para, index|
            if (para)
              block = para.split(/\n/)
              object = block[0]
              if (block[1])
                var = block[1].split(',')
                type = var[0]
                place = var[1]
                if block[2]
                  teach = block[2]
                  var2 = teach.split(' ')
                  init =  var2[-1]
                  var3 = init.split('.')
                  first_name = var3[0]
                  middle_name = var3[1]
                  last_name = var2[-2]
                  rank =  var2[-3]
                  full_name = last_name + " " + first_name + " " + middle_name
                  if !teachers.key?(full_name)
                    teachers[full_name] = []
                  end
                  number = index + 1
                  hash = Hash.new("")
                  hash["group"] = group
                  hash["object"] = object
                  hash["type"] = type
                  hash["place"] = place
                  hash["number"] = number.to_s
                  hash["date_time"] = date_time
                  teachers[full_name] << hash
                end
              end
            end
          end

          thursday = row[1..4]
          date_time = row[0]
          5.times {row.shift}

          thursday.each_with_index do |para, index|
            if (para)
              block = para.split(/\n/)
              object = block[0]
              if (block[1])
                var = block[1].split(',')
                type = var[0]
                place = var[1]
                if block[2]
                  teach = block[2]
                  var2 = teach.split(' ')
                  init =  var2[-1]
                  var3 = init.split('.')
                  first_name = var3[0]
                  middle_name = var3[1]
                  last_name = var2[-2]
                  rank =  var2[-3]
                  full_name = last_name + " " + first_name + " " + middle_name
                  if !teachers.key?(full_name)
                    teachers[full_name] = []
                  end
                  number = index + 1
                  hash = Hash.new("")
                  hash["group"] = group
                  hash["object"] = object
                  hash["type"] = type
                  hash["place"] = place
                  hash["number"] = number.to_s
                  hash["date_time"] = date_time
                  teachers[full_name] << hash
                end
              end
            end
          end

          friday = row[1..4]
          date_time = row[0]
          5.times {row.shift}
          friday = friday.compact

          friday.each_with_index do |para, index|
            if (para)
              block = para.split(/\n/)
              object = block[0]
              if (block[1])
                var = block[1].split(',')
                type = var[0]
                place = var[1]
                if block[2]
                  teach = block[2]
                  var2 = teach.split(' ')
                  init =  var2[-1]
                  var3 = init.split('.')
                  first_name = var3[0]
                  middle_name = var3[1]
                  last_name = var2[-2]
                  rank =  var2[-3]
                  full_name = last_name + " " + first_name + " " + middle_name
                  if !teachers.key?(full_name)
                    teachers[full_name] = []
                  end
                  number = index + 1
                  hash = Hash.new("")
                  hash["group"] = group
                  hash["object"] = object
                  hash["type"] = type
                  hash["place"] = place
                  hash["number"] = number.to_s
                  hash["date_time"] = date_time
                  teachers[full_name] << hash
                end
              end
            end
          end

          saturday = row[1..3]
          date_time = row[0]
          saturday.each_with_index do |para, index|
            if (para)
              block = para.split(/\n/)
              object = block[0]
              if (block[1])
                var = block[1].split(',')
                type = var[0]
                place = var[1]
                if block[2]
                  teach = block[2]
                  var2 = teach.split(' ')
                  init =  var2[-1]
                  var3 = init.split('.')
                  first_name = var3[0]
                  middle_name = var3[1]
                  last_name = var2[-2]
                  rank =  var2[-3]
                  full_name = last_name + " " + first_name + " " + middle_name
                  if !teachers.key?(full_name)
                    teachers[full_name] = []
                  end
                  number = index + 1
                  hash = Hash.new("")
                  hash["group"] = group
                  hash["object"] = object
                  hash["type"] = type
                  hash["place"] = place
                  hash["number"] = number.to_s
                  hash["date_time"] = date_time
                  teachers[full_name] << hash
                end
              end
            end
          end
        end
      end


      teachers.each do |last_name_with_initials, value|
        value.each do  |para|

          array = para["date_time"].split(' ')
          day = array[0]
          month = array[1]
          month = case month
                    when "января"
                      "1"
                    when "февраля"
                      "2"
                    when "марта"
                      "03"
                    when "апреля"
                      "4"
                    when "мая"
                      "5"
                    when "июня"
                      "6"
                    when "июля"
                      "7"
                    when "августа"
                      "8"
                    when "сентября"
                      "9"
                    when "октября"
                      "10"
                    when "ноября"
                      "11"
                    when "декабря"
                      "12"
                  end
          date_time = day + '/' + month
          date_time= Date.strptime(date_time, "%d/%m")
          schedule = Schedule.new
          schedule.last_name_with_initials = last_name_with_initials
          schedule.date_time = date_time
          schedule.object = para["object"]
          schedule.place = para["place"]
          schedule.kind = para["kind"]
          schedule.group = para["group"]
          schedule.save
         end
      end
    end
  end
end
