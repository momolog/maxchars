# needs jquery + tipsy
$.fn.extend
  maxChars: (setMaxLen) ->
    this.each ->
      $(this).tipsy({gravity: 'w', trigger: 'focus', html: true})
      .each ->
        el        = $(this)
        maxLen    = setMaxLen ? el.data('maxlen')
        template  = el.data('maxlen-text') || 'remaining chars: %x'
        hardLimit =!el.data('maxlen-soft')
        el.data 'doUpdateTitle', ->
          len = el.val().length
          if hardLimit && (len > maxLen)
            el.val(el.val().substr(0, maxLen))
            len = maxLen
          remaining     = maxLen - len 
          remainingText = template.replace(/%x/, remaining)
          el.attr('title', remainingText).tipsy('hide').tipsy('show')
          len 
      .live 'keyup', ->
        $(this).data('doUpdateTitle')()
