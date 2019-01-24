# require moduleres here
require "pry"
require "yaml"
# require_relative"./lib/emoticons.yml"
def load_library(file_path)

  emoticons = YAML.load_file(file_path)

  result = {'get_meaning'=> {}, 'get_emoticon' => {}}
  emoticons.each do |meaning, emoticon|
    result['get_meaning'][emoticon[1]] = meaning
    result['get_emoticon'][emoticon[0]] = emoticon[1]
  end
  result
  end

  def get_japanese_emoticon(file_path, emoticon)
    emoticons = load_library("./lib/emoticons.yml")
    emoticons['get_emoticon'].each do |eng, jap|
      if eng == emoticon
        return jap
      end
    end
    return "Sorry, that emoticon was not found"
end

def get_english_meaning(file_path, emoticon)
  emoticons = load_library("./lib/emoticons.yml")
  emoticons['get_meaning'].each do |jap, eng|
    if jap == emoticon
      return eng
    end
  end
  return "Sorry, that emoticon was not found"
end
