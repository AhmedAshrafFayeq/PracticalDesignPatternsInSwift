let text = "the facade is simple yet useful"
let spanishText = "hola"
print(text)

print(NLPFacade.dominantLanguage(for: text) ?? "-")

print(NLPFacade.partsOfSpeech(for: text))


print(NLPFacade.dominantLanguage(for: spanishText) ?? "-")

print(NLPFacade.partsOfSpeech(for: spanishText))
