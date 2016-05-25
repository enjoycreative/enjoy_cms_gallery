$(document).delegate "[data-enjoy-gallery-gallery-images-loader]", "click", (e)->
  e.preventDefault()

  link = $(e.currentTarget)
  url = link.attr('href')
  url = link.data("enjoy-gallery-gallery-images-loader-url") if !url or url == ""
  if url and url != ""
    $.get url, (data)->
      _target_selector = link.data("enjoy-gallery-gallery-images-target-selector")
      if _target_selector and _target_selector != ""
        _target = $(_target_selector)
        if _target.length > 0
          if link.data("enjoy-gallery-gallery-images-target-replace") == "true"
            _target.replaceWith(data)
          else
            _target.html(data)
          if link.data("enjoy-gallery-gallery-images-loader-remove") == "true"
            link.remove()
          return

      if link.data("enjoy-gallery-gallery-images-loader-insert-data") == "true"
        link.html(data)
      else
        link.replaceWith(data)


  return false
