require "yaml"
require "pry"

def load_library(file_path)
  library = YAML.load_file(file_path)
  library.each_with_object({}) do |emotion_array, new_hash|
    if new_hash["get_meaning"]
      new_hash["get_meaning"][emotion_array[1][1]] = emotion_array[0]
      new_hash["get_emoticon"][emotion_array[1][0]] = emotion_array[1][1]
    else
      new_hash["get_meaning"] = {emotion_array[1][1] => emotion_array[0]}
      new_hash["get_emoticon"] = {emotion_array[1][0] => emotion_array[1][1]}
    end
  end

end



def get_japanese_emoticon(file_path, emoticon)
japanese_emoticon = ""
directory = load_library(file_path)
  directory.each do |key, list|
    list.each do |us, japan|
      if directory["get_emoticon"] && us == emoticon
        japanese_emoticon = japan
      end
    end
  end
if japanese_emoticon == ""
  return "Sorry, that emoticon was not found"
end
japanese_emoticon
end



def get_english_meaning(file_path, emoticon)
meaning = ""
directory = load_library(file_path)
  directory.each do |key, list|
    list.each do |japan, word|
      if directory["get_meaning"] && japan == emoticon
        meaning = word
      end
    end
  end

if meaning == ""
  return "Sorry, that emoticon was not found"
end
meaning
end
