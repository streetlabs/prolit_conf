class @Prolit.FlashNotice
  constructor: ->
    @bindCloseHandler()

  bindCloseHandler: ()->
    $("#flash-notice .flash-close").click( ()->
      elem = $("#flash-notice")
      elem.fadeOut(800, ()->
        $("#flash-notice").remove()
      )
    )

jQuery ->
  Prolit.flash_notice = new Prolit.FlashNotice()
