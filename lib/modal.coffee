DEBUG = false

###
#     Template.materializeModalContainer
###
Template.materializeModalContainer.helpers
  modalOptions: ->
    Template.currentData().get()


###
#     Template.materializeModal
###
Template.materializeModal.onCreated ->
  console.log("Template.materializeModal.onCreated", @data) if DEBUG


Template.materializeModal.onRendered ->
  console.log("Template.materializeModal.onRendered", @data.title)  if DEBUG

  #
  # (1) Update the jQuery handle of the modal instance with the latest
  #     modal DOM element.
  #
  Materialize.modalize.$modal = $ @find '#materializeModal'

  #
  # (2) Compute modal animation duration.
  #     Fullscreen modals should appear instantly.
  #     Otherwise, 300ms transition.
  #
  if @data.fullscreen then inDuration = 0 else 300

  #
  # (3) Call Materialize's openModal() method to make
  #     the modal content appear.
  #
  # Set a callback to handle destroying the materializeModal template
  # if the user "completes" the modal, for instance by clicking
  # the background.
  #
  Materialize.modalize.$modal.openModal
    in_duration: inDuration
    dismissible: false
    ready: ->
      console.log("materializeModal: ready") if DEBUG
      $("div.lean-overlay").click (e) ->
        Materialize.modalize.$dispatcher.trigger
          type: 'dismissed'
    complete: ->
      console.log("materializeModal: complete") if DEBUG


Template.materializeModal.onDestroyed ->
  console.log("Template.materializeModal.onDestroyed") if DEBUG

Template.materializeModal.events
  "click #closeButton": (e, tmpl) ->
    e.preventDefault()
    console.log('closeButton') if DEBUG
    Materialize.modalize.close(false)

  "submit form#materializeModalForm, click button#submitButton": (e, tmpl) ->
    e.preventDefault()
    form = tmpl?.$('form#materializeModalForm')
    console.log('submit event:', e, "form:", form) if DEBUG
    Materialize.modalize.close true
    false # this prevents the page from refreshing on form submission!


###
#     Template.materializeModalBody
###
Template.modalizeBody.rendered = ->
  Materialize.modalize.$dispatcher = $ @find 'div[data-modalize-dispatcher]'
