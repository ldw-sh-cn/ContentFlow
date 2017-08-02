
class ContentFlow.SnippetModel

    # Content flows are made up of snippets of HTML. Snippets allow different
    # prefabricated sections of HTML to be entered into a flow before being
    # updated via the ContentTools editor.

    constructor: (id, type, scope='local', settings={}) ->

        # A unique Id (at least within the flow) for the snippet
        @id = id

        # The type of snippet (see SnippetType)
        @type = type

        # The scope of the snippet ('local', 'global')
        @scope = scope

        # A table of settings for the snippet
        @settings = settings

    # Class methods

    @fromJSONType: (flow, jsonTypeData) ->
        # Convert a JSON type object to a `Snippet` instance
        return new ContentFlow.SnippetModel(
            jsonTypeData.id,
            flow.getSnippetTypeById(jsonTypeData.type),
            jsonTypeData.scope,
            jsonTypeData.settings
        )


class ContentFlow.SnippetTypeModel

    # Snippets are created based on a SnippetType. The snippet type defines

    constructor: (id, label, imageURL=null) ->

        # A unique Id for the snippet type (at least within the flows on the
        # page).
        @id = id

        # A descriptive label for the snippet type
        @label = label

        # An (optional) preview image for the snippet type
        @imageURL = imageURL

    toSnippet: () ->
        # Convert the snippet type to a shell snippet
        return new ContentFlow.Snippet('', this)

    # Class methods

    @fromJSONType: (jsonTypeData) ->
        # Convert a JSON type object to a `SnippetType` instance
        return new ContentFlow.SnippetTypeModel(
            jsonTypeData.id,
            jsonTypeData.label,
            jsonTypeData.imageURL
        )