(function() {

  $.fn.extend({
    maxChars: function(setMaxLen) {
      return this.each(function() {
        return $(this).tipsy({
          gravity: 'w',
          trigger: 'focus',
          html: true
        }).each(function() {
          var el, hardLimit, maxLen, template;
          el = $(this);
          maxLen = setMaxLen != null ? setMaxLen : el.data('maxlen');
          template = el.data('maxlen-text') || 'remaining chars: %x';
          hardLimit = !el.data('maxlen-soft');
          return el.data('doUpdateTitle', function() {
            var len, remaining, remainingText;
            len = el.val().length;
            if (hardLimit && (len > maxLen)) {
              el.val(el.val().substr(0, maxLen));
              len = maxLen;
            }
            remaining = maxLen - len;
            remainingText = template.replace(/%x/, remaining);
            el.attr('title', remainingText).tipsy('hide').tipsy('show');
            return len;
          });
        }).live('keyup', function() {
          return $(this).data('doUpdateTitle')();
        });
      });
    }
  });

}).call(this);
