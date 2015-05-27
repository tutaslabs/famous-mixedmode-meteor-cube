Template.main.rendered = ->

  $(".famous-container").remove()
  div = document.createElement('div')
  div.className += "famous-container"

  document.body.appendChild(div)
  scene = Famous.Engine.createScene 'div'

# our top level node
  scene.addChild new App.app()

  Famous.Engine.init()




