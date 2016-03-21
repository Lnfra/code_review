json.array!(@code_languages) do |code_language|
  json.extract! code_language, :id
  json.url code_language_url(code_language, format: :json)
end
