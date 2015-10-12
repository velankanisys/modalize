DEBUG = false

###
#     Template.modalizeContainer
###
Template.modalizeContainer.helpers
  modalOptions: ->
    Template.currentData().get()


###
#     Template.modalizeModal
###
Template.modalizeModal.onCreated ->
  console.log("Template.modalizeModal.onCreated", @data) if DEBUG


Template.modalizeModal.onRendered ->
  console.log("Template.modalizeModal.onRendered", @data.title)  if DEBUG

  #
  # (1) Update the jQuery handle of the modal instance with the latest
  #     modal DOM element.
  #
  Materialize.modalize.$modal = $ @find '#modalizeModal'

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
  # Set a callback to handle destroying the modalizeModal template
  # if the user "completes" the modal, for instance by clicking
  # the background.
  #
  Materialize.modalize.$modal.openModal
    in_duration: inDuration
    dismissible: false
    ready: ->
      console.log("Modalize: ready") if DEBUG
      $("div.lean-overlay").click (e) ->
        #
        # (1) If the user clicks the modal overlay, issue the
        #     "dismissed" event to the modal body template.
        #
        Materialize.modalize.$dispatcher.trigger
          type: 'dismissed'
        #
        # (2) Close the modal unless the user has specifically set
        #     dismiss: false.
        #
        if Materialize.modalize.templateOptions.get().dismiss
          Materialize.modalize.close()

    complete: ->
      console.log("Modalize: complete") if DEBUG


Template.modalizeModal.onDestroyed ->
  console.log("Template.modalizeModal.onDestroyed") if DEBUG

Template.modalizeModal.events
  #
  # Clicking any element with the data-modalize-close attribute
  # should trigger the modal to close.
  #
  "click [data-modalize-close]": (e, tmpl) ->
    console.log('Modalize: Close Button') if DEBUG
    Materialize.modalize.close()

###
#     Template.modalizeBody
###
Template.modalizeBody.rendered = ->
  #
  # When a new modal is rendered, update the jQuery handle of the
  # hidden target element used to dispatch events into the modal.
  #
  Materialize.modalize.$dispatcher = $ @find 'div[data-modalize-dispatcher]'
