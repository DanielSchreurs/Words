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
        sReverseString= editor.getSelectedText().split(' ').reverse().join(' ')
        editor.insertText(sReverseString)
