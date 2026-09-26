import SwiftUI

// MARK: - Line helpers

func Narrator(_ text: String, _ color: Color = .highlight) -> Speech {
    Speech("Narrador", text, color)
}

func You(_ text: String, _ color: Color = .highlight) -> Speech {
    Speech("Você", text, color)
}

func Warning(_ text: String, _ color: Color = .red) -> Speech {
    Speech("Aviso", text, color)
}

func Line(_ character: String, _ text: String, _ color: Color = .highlight) -> Speech {
    Speech(character, text, color)
}

// MARK: - Choice helper

func Choice(
    _ title: String,
    description: String = "",
    icon: String,
    to destination: Destination
) -> ChoiceOption {
    ChoiceOption(
        title: title,
        description: description,
        icon: icon,
        destination: destination
    )
}

// MARK: - Result builders

@resultBuilder
enum SpeechBuilder {
    static func buildBlock() -> [Speech] {
        []
    }

    static func buildBlock(_ components: Speech...) -> [Speech] {
        Array(components)
    }

    static func buildArray(_ components: [[Speech]]) -> [Speech] {
        components.flatMap { $0 }
    }

    static func buildOptional(_ component: [Speech]?) -> [Speech] {
        component ?? []
    }

    static func buildEither(first component: [Speech]) -> [Speech] {
        component
    }

    static func buildEither(second component: [Speech]) -> [Speech] {
        component
    }
}

@resultBuilder
enum ChoiceBuilder {
    static func buildBlock(_ components: ChoiceOption...) -> [ChoiceOption] {
        Array(components)
    }

    static func buildArray(_ components: [[ChoiceOption]]) -> [ChoiceOption] {
        components.flatMap { $0 }
    }
}

@resultBuilder
enum SceneBuilder {
    static func buildBlock(_ components: SceneDefinition...) -> [SceneDefinition] {
        Array(components)
    }

    static func buildArray(_ components: [[SceneDefinition]]) -> [SceneDefinition] {
        components.flatMap { $0 }
    }
}

// MARK: - Scene definition

struct SceneDefinition {
    let id: SceneID
    let era: EraID
    let model: ModelAsset
    let lines: [Speech]
    let next: Destination
    let choiceTitle: String?
    let choices: [ChoiceOption]?

    func makeSequence() -> Sequence {
        let choose: Choose? = {
            guard let choiceTitle, let choices, !choices.isEmpty else { return nil }
            return Choose(choiceTitle, choices)
        }()

        return Sequence(
            id: id,
            era: era,
            modelName: model.rawValue,
            speech: lines,
            choose: choose,
            next: next
        )
    }
}

/// Linear scene: after dialogue, go to `next`.
func scene(
    _ id: SceneID,
    era: EraID,
    model: ModelAsset,
    next: Destination,
    @SpeechBuilder lines: () -> [Speech]
) -> SceneDefinition {
    SceneDefinition(
        id: id,
        era: era,
        model: model,
        lines: lines(),
        next: next,
        choiceTitle: nil,
        choices: nil
    )
}

/// Branching scene: after dialogue (or immediately if empty), show choices.
func choiceScene(
    _ id: SceneID,
    era: EraID,
    model: ModelAsset,
    prompt: String,
    @SpeechBuilder lines: () -> [Speech],
    @ChoiceBuilder choices: () -> [ChoiceOption]
) -> SceneDefinition {
    SceneDefinition(
        id: id,
        era: era,
        model: model,
        lines: lines(),
        next: .scene(id),
        choiceTitle: prompt,
        choices: choices()
    )
}

func scenes(@SceneBuilder _ content: () -> [SceneDefinition]) -> [SceneDefinition] {
    content()
}
