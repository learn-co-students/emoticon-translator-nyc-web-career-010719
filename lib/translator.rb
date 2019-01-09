# require moduleres here
require "pry"
def load_library(file_path)
  emoticon_dictionary = {}
  emoticon_dictionary["get_meaning"] = {}
  emoticon_dictionary["get_emoticon"] ={}

  emoticon_file = YAML.load_file(file_path)
  emoticon_file.each do |meaning, emoticons_arr|
    emoticons_arr.each_with_index do |language, i|
      usa = language[0]
      japanese = language[1]

      emoticon_dictionary["get_meaning"][japanese] = emoticon_text
      emoticon_dictionary["get_emoticon"][usa] = japanese
    end
  end

emoticon_dictionary

end

def get_japanese_emoticon(file_path, emoticon)
  load_library(file_path)
    if emoticon_dictionary["get_emoticon"][usa] == emoticon
      binding.pry
      return emoticon_dictionary["get_emoticon"]
    else
      return "Sorry, that emoticon was not found"
    end
end

def get_english_meaning
  # code goes here
end
