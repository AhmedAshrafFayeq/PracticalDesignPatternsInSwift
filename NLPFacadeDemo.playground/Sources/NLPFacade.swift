import Foundation
import NaturalLanguage

public class NLPFacade {
    private static let tagger = NLTagger(tagSchemes: [NLTagScheme.lexicalClass])
    
    //return optional string in case it's nil  or can't recognize the language
    public class func dominantLanguage(for string: String) -> String? {
        let language = NLLanguageRecognizer.dominantLanguage(for: string)
        return language?.rawValue
    }
    
    public struct WordLexicalClassPair: CustomStringConvertible {
        let word, lexicalClass: String
        
        public var description: String {
            return "\(word): \(lexicalClass)"
        }
    }
    
    public class func partsOfSpeech(for text: String) -> [WordLexicalClassPair] {
        var result = [WordLexicalClassPair]()
        tagger.string = text
        tagger.enumerateTags(in: text.startIndex..<text.endIndex, unit: .word, scheme: NLTagScheme.lexicalClass, options: [.omitPunctuation, .omitWhitespace]) { tag, range in
            let wordLexicalClass = WordLexicalClassPair(word: String(text[range]), lexicalClass: (tag?.rawValue ?? "unknown"))
            result.append(wordLexicalClass)
            return true
        }
        return result
    }
}
