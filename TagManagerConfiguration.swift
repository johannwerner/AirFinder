import Foundation

struct TagManagerConfiguration {
    enum TagType: String {
        case underline = "<u>"
        case bold = "<b>"
        case custom = "<custom>"
        case custom1 = "<custom1>"
    }
    
    /// dictionary of tags with the corresponding attributes
    var tags: [TagType: [NSAttributedString.Key: Any]]
    
    /// dictionary of attributes to apply to the whole text
    var wholeText: [NSAttributedString.Key: Any]
}

extension TagManagerConfiguration {
    final class Builder {
        /// Wrapper of TagManagerConfiguration.TagType
        typealias TagType = TagManagerConfiguration.TagType
        
        /// Tags that will be used to create TagManagerConfiguration
        var tags: [TagType: [NSAttributedString.Key: Any]] = [
            TagType.underline: [NSAttributedString.Key.underlineStyle: 1.0]
        ]
        
        // attributes which will be applied to TagManagerConfiguration
        var wholeText: [NSAttributedString.Key: Any] = [:]
        
        /// Adds the given attributes to the given tag
        ///
        /// - Parameters:
        ///   - tag: tag definition in TagManagerConfiguration.TagType
        ///   - attrs: Dictionary with attributes to be applied
        /// - Returns: the builder instance
        func addProperty(tag: TagType, attrs: [NSAttributedString.Key: Any]) -> Builder {
            var dict = attrs
            if let previous = tags[tag] {
                dict.merge(previous, uniquingKeysWith: { $1 })
            }
            
            tags[tag] = dict
            return self
        }
        
        /// Adds the given attibutes to the whole text
        /// Will be applied after removing all tags
        ///
        /// - Parameter attrs: Dictionary with attributes to be applied
        /// - Returns: the builder instance
        func addProperty(attrs: [NSAttributedString.Key: Any]) -> Builder {
            wholeText.merge(attrs, uniquingKeysWith: { $1 })
            return self
        }
        
        /// Creates the TagManagerConfiguration
        ///
        /// - Returns: instance of managerConfiguration
        func build() -> TagManagerConfiguration {
            return TagManagerConfiguration(tags: tags, wholeText: wholeText)
        }
    }
}
