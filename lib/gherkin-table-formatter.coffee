TableFormatter = require './table-formatter.coffee'

module.exports =
    config:
      spacePadding:
        type: 'integer'
        default: 1
        description:
          'How many spaces between left and right of each column content'
      gherkinGrammarScopes:
        type: 'array'
        default: ['source.feature', 'text.gherkin.feature']
        description:
          'File grammar scopes that will be considered Gherkin by this package (comma-separated).
          Open the Command Palette and run \'Editor: Log Cursor Scope\' to see what grammar scope
          is used by your grammar. Top entry is usually file grammar scope.'
        items:
          type: 'string'

    activate: ->
      @tableFormatter = new TableFormatter()
      #Register command to workspace
      @command = atom.commands.add "atom-text-editor",
        "gherkin-table-formatter:format", (event) =>
          @tableFormatter.format(event.currentTarget.getModel())

    deactivate: ->
      @command.dispose()
      @tableFormatter.destroy()
