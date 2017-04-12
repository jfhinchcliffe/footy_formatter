

class Article < ActiveRecord::Base
    def translate
       format_times(self.body)
    end
    
    private
    
    def format_times(body)
       body.gsub(/[0-2]\d:[0-6]\d(d|u)?/) { |word| convert_to_12_hour(word) }
    end
    
    def convert_to_12_hour(date)
        date = pick_up_or_drop_off(date) if date.count("u") > 0 || date.count("d") > 0
        converted_nums = []
        date.split(':').each do |num|
            converted_nums << num
        end
        ptv_date_format(converted_nums)
    end
    
    def pick_up_or_drop_off(date)
        if date.count("u") > 0
            date[0..-2] + ": (pick up only)"
        elsif date.count("d") > 0
            date[0..-2] + ": (drop off only)"
        else
            date
        end
    end
    
    def ptv_date_format(date_array)
        hour = date_array[0].to_i
        minute = date_array[1].slice(0..1)
        pick_up_drop_off =date_array[2]
        am_or_pm = ""
        hour > 11 ? am_or_pm = "pm" : am_or_pm = "am"
        hour -= 12 if hour > 12
        "#{hour}.#{minute}#{am_or_pm} #{pick_up_drop_off}"
    end
        
end
