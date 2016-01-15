{CompositeDisposable} = require 'atom'

module.exports =
  subscriptions: null

  activate: ->
    @subscriptions = new CompositeDisposable
    @subscriptions.add atom.commands.add 'atom-workspace',
      'words:inverse': => @inverse()

  deactivate: ->
    @subscriptions.dispose()

  inverse: ->
    if editor = atom.workspace.getActiveTextEditor()
        texts = (editor.getSelections().map (item) -> item.getText()).reverse()
        if ! texts[1]
            texts[0] = texts[0].split(/\s/).reverse().join(' ')
        for selection, i in editor.getSelections()
            selection.insertText(texts[i], {select: true})
